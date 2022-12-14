import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthMethods {
  final FirebaseAuth auth = FirebaseAuth.instance;

  getCurrentUser(){
    return auth.currentUser;
  }

  signInWithGoogle(BuildContext contex) async {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount = 
      await _googleSignIn.signIn();
    
    final GoogleSignInAuthentication? googleSignInAuthentication = await
    googleSignInAccount?.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication?.idToken,
      accessToken: googleSignInAuthentication?.accessToken
    );
    _firebaseAuth.signInWithCredential(credential);
  }
}