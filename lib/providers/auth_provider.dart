
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum AuthStatus {
  NotAuthenticated,
  Authenticating,
  Authenticated,
  UserNotFound,
  Error,
}

class AuthProvider extends ChangeNotifier {
  User? user;
  late FirebaseAuth _auth;
  AuthStatus status = AuthStatus.NotAuthenticated;

  static AuthProvider instance = AuthProvider();

  AuthProvider() {
    _auth = FirebaseAuth.instance;
  }

  Future<void> loginUserWithEmailAndPassword(
      String email, String password) async {
    status = AuthStatus.Authenticating;
    notifyListeners();

    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      user = result.user;
      status = AuthStatus.Authenticated;

      print('Logged in successfully!');
      notifyListeners();
    } catch (e) {
      status = AuthStatus.Error;
      print(e.toString());
    }
    notifyListeners();
  }
}