import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class User {
  final String key;
  String? userID = Uuid().v4();
  final String email;
  final String userName;
  late final String displayName;
  final String imageUrl;
  final int following;
  final int followers;
  final List<String> followersList;
  final List<String> followingList;
  late final String bio;
  final String coverImgUrl;

  User({
    this.key = "",
    this.userName = "",
    this.userID,
    this.email = "",
    this.displayName = "",
    this.imageUrl = "",
    this.following = 0,
    this.followers = 0,
    this.followingList = const [],
    this.followersList = const [],
    this.bio = "No bio available",
    this.coverImgUrl = "",
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      key: json['key'],
      userName: json['userName'],
      userID: json['userID'],
      email: json['email'],
      displayName: json['displayName'],
      imageUrl: json['imageUrl'],
      following: json['following'],
      followers: json['followers'],
      followersList: json['followersList'].cast<String>(),
      followingList: json['followingList'].cast<String>(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['userName'] = this.userName;
    data['userID'] = this.userID;
    data['email'] = this.email;
    data['displayName'] = this.displayName;
    data['imageUrl'] = this.imageUrl;
    data['following'] = this.following;
    data['followers'] = this.followers;
    data['followersList'] = this.followersList;
    data['followingList'] = this.followingList;
    return data;
  }

  static Future<User> getCurrentUser() async {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      return User(
        userID: currentUser.uid,
        // Populate other user properties here if needed
      );
    }

    return User();
  }
}
