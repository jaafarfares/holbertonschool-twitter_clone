import 'package:flutter/material.dart';
import 'package:twitter/assets/dummydatat.dart';

class UsersSearchResultsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: userList.length,
          itemBuilder: (context, index) {
            final user = userList[index];
            return _buildUserItem(
              name: user['name'],
              username: user['username'],
              bio: user['bio'],
              isVerified: user['isVerified'],
              imgUrl: user['imgUrl'],
            );
          },
        ),
      ),
    );
  }
}

Widget _buildUserItem({
  required String name,
  required String username,
  required String bio,
  required bool isVerified,
  required String imgUrl,
}) {
  return Container(
    padding: const EdgeInsets.only(top: 18, left: 12, right: 12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.blue, width: 2),
          ),
          width: 40,
          height: 40,
          child: Image.network(imgUrl, fit: BoxFit.cover),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              Text(
                bio,
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                username,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ),
        const SizedBox(width: 20),
        if (isVerified) const Icon(Icons.verified, color: Colors.blue),
      ],
    ),
  );
}
