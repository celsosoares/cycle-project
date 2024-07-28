import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:developer';
// import 'package:cycle_project/pages/auth/signinPage.dart';


class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<void> logoutAndNavigateToHome(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      // Navigator.pushAndRemoveUntil(
      //   context,
      //   MaterialPageRoute(builder: (context) => SignInPage()), // Tela inicial do seu aplicativo
      //       (route) => false, // Remove todas as rotas anteriores da pilha
      // );
    } catch (e) {
      log('Erro ao realizar logout: $e');
    }
  }
}