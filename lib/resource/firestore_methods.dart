import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:instagram_clone/models/post_model.dart';
import 'package:instagram_clone/resource/storage_methods.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadPost(String description, Uint8List file, String uid,
      String username, String profImage) async {
    String res = "some error occured";

    final storageRef = FirebaseStorage.instance.ref();

    try {
      String photoUrl =
          await StorageMethods().uploadImageStorage("posts", file, true);

      String postId = const Uuid().v1();

      PostModel postModel = PostModel(
        description: description,
        uid: uid,
        postId: postId,
        username: username,
        datePosted: DateTime.now(),
        postUrl: photoUrl,
        profileImg: profImage,
        likes: [],
      );

      _firestore.collection("posts").doc(postId).set(postModel.toJson());

      return res = "success";
    } catch (err) {
      return res = err.toString();
    }
  }
}
