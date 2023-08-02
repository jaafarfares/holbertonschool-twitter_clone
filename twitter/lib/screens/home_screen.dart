import 'package:flutter/material.dart';
import 'package:twitter/widgets/side_bar_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        /*  leading: GestureDetector(
          child: Icon(Icons.menu),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SideBarMenu()),
            );
          },
        ), */
      ),
      drawer: SideBarMenu(),
    );
  }
}
