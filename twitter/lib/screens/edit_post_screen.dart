import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:twitter/models/post.dart';
import '../models/post.dart';
import '../providers/auth_state.dart';

class EditPostScreen extends StatelessWidget {
  const EditPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Auth(); // Create an instance of the Auth class
    String? currentUserId;

    // Get the current user's ID using getCurrentUserModel()
    auth.getCurrentUserModel().then((userModel) {
      currentUserId = userModel.userID;
    }).catchError((error) {
      // Handle the error if needed
      print('Error getting current user: $error');
    });
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () async {
                if (currentUserId != null) {
                  Post newPost = Post(
                    text: 'This calls for celebrating!\nCongratulations!',
                    userID: currentUserId,
                  );

                  await FirebaseFirestore.instance
                      .collection('posts')
                      .add(newPost.toJson());
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue.withOpacity(0.7),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: Text('Tweet',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 60),
          Row(
            children: [
              Container(
                height: 90.0,
                width: 90.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 6.0,
                  ),
                ),
                child: ClipOval(
                  child: Image.network(
                    "https://cdn.pocket-lint.com/r/s/1200x/assets/images/153339-games-news-does-mario-sunbathing-pic-mean-mario-sunshine-for-switch-is-near-image1-9zsg71zrml.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: TextField(
                  maxLines: 2,
                  decoration: InputDecoration(
                    hintText: 'This calls for celebrating!\nCongratulations!',
                    border: InputBorder.none,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
