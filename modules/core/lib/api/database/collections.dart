import 'package:cloud_firestore/cloud_firestore.dart';

class Collections {
  static final usersCollection = FirebaseFirestore.instance.collection(
    'users',
  );
}
