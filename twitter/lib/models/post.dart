import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String? text;
  final String? userID;
  final String? likeCount;
  final String? likeList;
  final Timestamp timestamp;

  Post({
    this.text,
    this.userID,
    this.likeCount,
    this.likeList,
    required this.timestamp,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      text: json['text'],
      userID: json['userID'],
      likeCount: json['likeCount'],
      likeList: json['likeList'],
      timestamp: json['timestamp'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'userID': userID,
      'likeCount': likeCount,
      'likeList': likeList,
      'timestamp': FieldValue.serverTimestamp(),
    };
  }
}
