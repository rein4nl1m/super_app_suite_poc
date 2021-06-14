import 'package:core/api/api_constants/api_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthApi {
  FirebaseAuth _auth = FirebaseAuth.instance;

  static final FirebaseAuthApi _instance = FirebaseAuthApi._internal();

  factory FirebaseAuthApi() {
    return _instance;
  }

  FirebaseAuthApi._internal();

  Future<dynamic> signIn({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case AuthExceptions.USER_DISABLED:
          return 'Usuário inativo!';
        case AuthExceptions.USER_NOT_FOUND:
          return 'Usuário não encontrado!';
        case AuthExceptions.WRONG_PASSWORD:
          return 'Senha incorreta!';
        default:
          return null;
      }
    } catch (e) {
      print('signIn error: $e');
    }
  }

  Future<dynamic> register({
    required String name,
    required String email,
    required String password,
  }) async {
    User? user;
    UserCredential userCredential;

    try {
      userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      user = userCredential.user;
      await user!.updateDisplayName(name);
      await user.reload();
      user = _auth.currentUser;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case RegisterExceptions.WEAK_PASSWORD:
          return 'A senha fornecida é muito fraca.';
        case RegisterExceptions.EMAIL_ALREADY_IN_USE:
          return 'A conta já existe para esse e-mail.';
        default:
          return null;
      }
    } catch (e) {
      print('register error: $e');
    }

    return user;
  }

  Future<void> recoveryPassword({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print('recory password error: $e');
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
