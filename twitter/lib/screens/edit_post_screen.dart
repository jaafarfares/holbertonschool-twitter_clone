import 'package:flutter/material.dart';
import 'package:twitter/models/user.dart';
import '../providers/auth_state.dart';

class EditPostScreen extends StatelessWidget {
  const EditPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _textEditingController =
        TextEditingController();

    final auth = Auth();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
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
                final currentUser = await User.getCurrentUser();
                if (currentUser.userID != null) {
                  String postText = _textEditingController.text;
                  if (postText.isNotEmpty) {
                    await auth.addPost(context, currentUser.userID!, postText);
                    _textEditingController.clear();
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue.withOpacity(0.7),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: const Text(
                'Tweet',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
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
                  controller: _textEditingController,
                  maxLines: 2,
                  decoration: const InputDecoration(
                    hintText: 'click here to add your Post!\n...',
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
