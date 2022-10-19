import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

class StorageMethods {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //Storing image method to firebase storage
  Future<String> uploadImageStorage(String childName, Uint8List file, bool isPost) async {
    final storageRef = _storage.ref();

    Reference imageRef =
        storageRef.child(childName).child(_firebaseAuth.currentUser!.uid);

    UploadTask uploadImage = imageRef.putData(file);


    TaskSnapshot taskSnapshot = await uploadImage;
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();

    return downloadUrl;
  }
}
