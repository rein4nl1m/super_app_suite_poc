library core;

import 'package:firebase_core/firebase_core.dart';
export 'api/auth/firebase_auth_api.dart';
export 'api/database/firebase_firestore_api.dart';
export 'di/injection_container.dart';
export 'data/bloc/user_bloc.dart';

class Core {
  static initApp() async {
    await Firebase.initializeApp();
  }
}
