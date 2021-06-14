import 'package:core/api/auth/firebase_auth_api.dart';
import 'package:core/api/database/collections.dart';
import 'package:core/data/models/userProfile.dart';

class FirebaseFirestoreApi {
  static final FirebaseFirestoreApi _instance =
      FirebaseFirestoreApi._internal();

  factory FirebaseFirestoreApi() {
    return _instance;
  }

  FirebaseFirestoreApi._internal();

  Future<void> createUserProfile({
    required String name,
    required String email,
  }) async {
    UserProfile profile = UserProfile(name: name, email: email);
    try {
      await Collections.usersCollection.add(profile.toMap());
    } catch (e) {
      print('createUserProfile error: $e');
    }
  }

  Future<UserProfile?> get getUserProfile async {
    UserProfile? profile;
    try {
      var auth = FirebaseAuthApi();
      var currentUser = await auth.currentUser;

      var doc = (await Collections.usersCollection
              .where('email', isEqualTo: currentUser!.email)
              .get())
          .docs
          .first;

      if (doc.exists) {
        profile = UserProfile.fromMap(
          doc.data(),
        );
      }

      return profile;
    } catch (e) {
      print('getUserProfile error: $e');
    }
  }
}
