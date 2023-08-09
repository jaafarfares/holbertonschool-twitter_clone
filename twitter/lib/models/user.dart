import 'package:flutter/material.dart';

class User {
  final String key;
  final String userID;
  final String email;

  final String userName;
  final String displayName;
  final String imageUrl;
  final int following;
  final int followers;
  final List<String> followersList;
  final List<String> followingList;

  User({
    this.key = "",
    this.userName = "",
    this.userID = "",
    this.email = "",
    this.displayName = "",
    this.imageUrl = "",
    this.following = 0,
    this.followers = 0,
    this.followingList = const [],
    this.followersList = const [],
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
}
