import 'package:flutter/material.dart';
import 'package:twitter/models/user.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.userID});
  final String userID;
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() async {
    super.initState();
    await User().getUserByID(widget.userID);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        return Scaffold(
          body: Column(
            children: [
              Stack(
                children: <Widget>[
                  Container(
                    width: 290,
                    height: 190,
                    color: Colors.green,
                  ),
                  Container(
                    width: 250,
                    height: 170,
                    color: Colors.red,
                  ),
                  Container(
                    width: 220,
                    height: 150,
                    color: Colors.yellow,
                  ),
                ],
              )
            ],
          ),
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}
