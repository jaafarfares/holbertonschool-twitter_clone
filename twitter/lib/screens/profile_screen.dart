import 'package:flutter/material.dart';
import 'package:twitter/models/user.dart';
import 'package:twitter/providers/auth_state.dart';
import 'package:twitter/screens/edit_profile_screen.dart';
import 'package:twitter/widgets/bottom_bar_menu.dart';
import 'package:twitter/widgets/post_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, this.userID = ""});
  final String userID;
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final auth = Auth();
  String? currentUserId;

  @override
  void initState() {
    super.initState();
    _loadCurrentUser();
  }

  Future<void> _loadCurrentUser() async {
    try {
      final userModel = await auth.getCurrentUserModel();
      setState(() {
        currentUserId = userModel.userID;
      });
    } catch (error) {
      print('Error getting current user: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(builder: (context, snapshot) {
      return Scaffold(
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: 170.0,
                  color: Colors.white,
                  child: Center(
                    child: Image.network(
                      'https://www.toynk.com/cdn/shop/articles/How-Many-Super-Mario-Games-are-there.jpg?v=1648640966&width=1500',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 30.0, top: 30),
                    // color: Colors.white,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Mario",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                          SizedBox(height: 9),
                          Text(
                            "@SuperMario",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 9),
                          const Text(
                            "Holberton School",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Row(
                            children: [
                              Icon(Icons.calendar_month),
                              Text(
                                "Joined October 2022",
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          const Row(
                            children: [
                              Text(
                                "25  ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              Text(
                                "Following  ",
                                style: TextStyle(
                                    color: Colors.blueGrey, fontSize: 18),
                              ),
                              Text(
                                "5  ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              Text(
                                "Followers  ",
                                style: TextStyle(
                                    color: Colors.blueGrey, fontSize: 18),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  const Text(
                                    "Tweets",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.blueGrey),
                                  ),
                                  SizedBox(height: 9),
                                  Container(
                                    width: 59,
                                    height: 4,
                                    color: Colors.blue, // Blue line color
                                  ),
                                ],
                              ),
                              const Column(
                                children: [
                                  Text(
                                    "Tweets & Replies",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.blueGrey),
                                  ),
                                ],
                              ),
                              const Column(
                                children: [
                                  Text(
                                    "Media",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.blueGrey),
                                  ),
                                ],
                              ),
                              const Column(
                                children: [
                                  Text(
                                    "Likes",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.blueGrey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          PostWidget(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 100.0,
              left: 20.0,
              right: 20.0,
              child: Row(
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
                ],
              ),
            ),
            Positioned(
              top: 150.0,
              left: 250.0,
              right: 20.0,
              child: Container(
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.grey),
                      ),
                    ),
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.white),
                  ),
                  child: Text(
                    "Edit Profile",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditProfileScreen()),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BarMenu(),
      );
    });
  }
}
