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
      print('createUserProfile erro: $e');
    }
  }
}
