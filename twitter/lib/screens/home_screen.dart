import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter/providers/app_state.dart';
import 'package:twitter/screens/signin_screen.dart';
import 'package:twitter/widgets/bottom_bar_menu.dart';
import 'package:twitter/widgets/side_bar_menu.dart';
import 'package:twitter/widgets/users_search_results_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // Add this line

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Center(
          child: GestureDetector(
              onTap: () {
                /*        Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UsersSearchResultsWidget()),
                ); */
              },
              child: const Text('Home')),
        )),
        drawer: const SideBarMenu(),
        //bottomNavigationBar: const BarMenu(),
      ),
    );
  }
}
