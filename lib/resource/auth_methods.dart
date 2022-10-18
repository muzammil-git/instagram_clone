import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Sign up user
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required Uint8List file, // Why not File file ?
  }) async {
    String res = "Some error occured";

    try {
      if (email.isNotEmpty || password.isNotEmpty || username.isNotEmpty || file!=null) {
        UserCredential userCred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        String uid = userCred.user!.uid;
        print(uid);

        _firestore.collection("users").doc(uid).set({
          "username": username,
          "email": email,
          "uid": uid,
          'followers': [],
          'following': [],
          "timestamp": DateTime.now().toUtc()
        });

        return res = "success";
      }
    } catch (e) {
      return res = res.toString();
    }

    return 'Validators didnt hit';
  }
}
