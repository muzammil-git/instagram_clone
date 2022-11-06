import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class PostModel {
  final String description;
  final String uid;
  final String postId;
  final String username;
  final datePosted;
  final String postUrl;
  final String profileImg;
  final List likes;

  const PostModel({
    required this.description,
    required this.uid,
    required this.postId,
    required this.username,
    required this.datePosted,
    required this.postUrl,
    required this.profileImg,
    required this.likes,
  });

  Map<String, dynamic> toJson() => {
        "description": description,
        "uid": uid,
        "postId": postId,
        "username": username,
        "datePosted" : datePosted,
        "postUrl": postUrl,
        "profileImg" : profileImg,
        "likes" : likes
      };

  static PostModel fromJson(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return PostModel(
      description: snapshot['description'],
      uid: snapshot['uid'],
      postId: snapshot['post_id'],
      username: snapshot['username'],
      datePosted : snapshot['datePosted'],
      postUrl: snapshot['postUrl'],
      profileImg : snapshot['profileImg'],
      likes : snapshot['likes']
    );
  }
}
