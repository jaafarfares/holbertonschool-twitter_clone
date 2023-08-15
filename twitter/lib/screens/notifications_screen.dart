import 'package:flutter/material.dart';
import 'package:twitter/widgets/bottom_bar_menu.dart';
import 'package:twitter/widgets/post_widget.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 9,
        //primary: false,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Container(
          padding: const EdgeInsets.only(top: 8),
          width: 20,
          height: 20,
          child: Image.asset(('asstes/logo/logo.png')),
        ),
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        //centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.blue,
            ),
            onPressed: () {
              // Handle the settings icon press here
            },
          ),
        ],
      ),
      body: Center(
          /* Text(
          'No Notifications Yet',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ), */
          ),
      bottomNavigationBar: BarMenu(),
    );
/*     return Center(
      child: Text('Notifications Screen'),
    ); */
  }
}
