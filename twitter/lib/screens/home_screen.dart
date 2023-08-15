import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter/providers/app_state.dart';
import 'package:twitter/providers/auth_state.dart';
import 'package:twitter/screens/chats_screen.dart';
import 'package:twitter/screens/edit_post_screen.dart';
import 'package:twitter/screens/notifications_screen.dart';
import 'package:twitter/screens/search_screen.dart';
import 'package:twitter/screens/signin_screen.dart';
import 'package:twitter/widgets/bottom_bar_menu.dart';
import 'package:twitter/widgets/post_widget.dart';
import 'package:twitter/widgets/side_bar_menu.dart';
import 'package:twitter/widgets/users_search_results_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context, listen: false);
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SignIn()),
        );
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await auth.logout();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SignIn()),
              );
            },
          ),
        ],
      ),
      drawer: SideBarMenu(),
      bottomNavigationBar: BarMenu(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  PostWidget(),
                  PostWidget(),
                  // Add more PostWidget instances as needed
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0), // Adjust the padding as needed
            child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditPostScreen()),
                  );
                },
                backgroundColor: Colors.blue,
                child: Icon(Icons.add, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
