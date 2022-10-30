import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:instagram_clone/resource/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Sign up user
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required Uint8List
        file, // Why not File file ? Bcuz file doesn't work on web
  }) async {
    String res = "Some error occured";

    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          file != null) {
        UserCredential userCred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        String uid = userCred.user!.uid;

        String photoUrl = await StorageMethods()
            .uploadImageStorage('profileImage', file, false);
        print(photoUrl);

        await _firestore.collection("users").doc(uid).set({
          "username": username,
          "email": email,
          "uid": uid,
          'followers': [],
          'following': [],
          "timestamp": DateTime.now().toUtc(),
          "photoUrl": photoUrl
        });

        return res = "success";
      }
    } on FirebaseAuthException catch (err) {
      if (err.code == "invalid-email") {
        res = "The email is badly formated, please rewrite";
      }
    } catch (e) {
      return res = "${e.toString()}";
    }

    return 'Validators didnt hit';
  }

  // Sign up user
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error occured";

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } on FirebaseAuthException catch (err) {
      if (err.code == "wrong-password") {
        return err.message.toString();
      }
      return err.toString();
    } catch (e) {
      return e.toString();
    }

    return res;
  }
}
