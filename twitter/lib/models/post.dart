class Post {
  final String? text;
  final String? userID;
  final String? likeCount;
  final String? likeList;

  Post({this.text, this.userID, this.likeCount, this.likeList});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      text: json['text'],
      userID: json['userID'],
      likeCount: json['likeCount'],
      likeList: json['likeList'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'userID': userID,
      'likeCount': likeCount,
      'likeList': likeList,
    };
  }
}
