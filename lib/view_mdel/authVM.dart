import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_box/repo/auth_repo.dart';

class AuthVM with ChangeNotifier {
  AuthRepo _authRepo = AuthRepo();

  bool isLoading = false;
  String? errorMessage;

  // -------------------Sign up ---------------
  Future<void> signUp(String email, String password) async {
    try {
      isLoading = true;
      notifyListeners();
      await _authRepo.signUp(email, password);
      errorMessage = null;
    } on FirebaseAuthException catch (e) {
      errorMessage = e.message;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  //-----------------------login ---------------------

  Future<void> login(String email, String password) async {
    try {
      isLoading = true;
      notifyListeners();
      await _authRepo.logIn(email, password);
      errorMessage = null;
    } on FirebaseAuthException catch (e) {
      errorMessage = e.message;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
  Future<void> forgotPassword(String email) async {
    try {
      isLoading = true;
      notifyListeners();
      await _authRepo.forgotPassword(email);
      errorMessage = null;
    } on FirebaseAuthException catch (e) {
      errorMessage = e.message;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
