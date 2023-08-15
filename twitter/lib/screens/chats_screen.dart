import 'package:flutter/material.dart';
import 'package:twitter/widgets/bottom_bar_menu.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
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
          'Chat',
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
      body: const Center(
          child: Text(
        'No Chats Yet',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
      )),
      bottomNavigationBar: BarMenu(),
    );
    /*    return Center(
      child: Text('Chats Screen'),
    ); */
  }
}
