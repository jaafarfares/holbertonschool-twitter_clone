/* import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter/providers/app_state.dart';
import 'package:twitter/screens/chats_screen.dart';
import 'package:twitter/screens/home_screen.dart';
import 'package:twitter/screens/notifications_screen.dart';
import 'package:twitter/screens/search_screen.dart';

class BarMenu extends StatefulWidget {
  const BarMenu({super.key});

  @override
  State<BarMenu> createState() => _BarMenuState();
}

class _BarMenuState extends State<BarMenu> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final sharedState = Provider.of<SharedState>(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        currentIndex: currentPageIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedFontSize: 0,
        selectedFontSize: 0,
        elevation: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: '',
          ),
        ],
        onTap: (value) {
          /*         setState(() {
            currentPageIndex = value;
          }); */
          sharedState.setpageIndex = currentPageIndex = value;
        },
      ),
      body: [
        const HomeScreen(),
        const SearchScreen(),
        const NotificationsScreen(),
        const ChatsScreen(),
      ][currentPageIndex],
    );
  }
}
 */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter/providers/app_state.dart';
import 'package:twitter/screens/chats_screen.dart';
import 'package:twitter/screens/home_screen.dart';
import 'package:twitter/screens/notifications_screen.dart';
import 'package:twitter/screens/search_screen.dart';

class BarMenu extends StatefulWidget {
  const BarMenu({Key? key}) : super(key: key);

  @override
  State<BarMenu> createState() => _BarMenuState();
}

class _BarMenuState extends State<BarMenu> {
  @override
  Widget build(BuildContext context) {
    final sharedState = Provider.of<SharedState>(context);
    final screens = [
      HomeScreen(),
      SearchScreen(),
      NotificationsScreen(),
      ChatsScreen(),
    ];

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.white,
      currentIndex: sharedState.pageNum,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      unselectedFontSize: 0,
      selectedFontSize: 0,
      elevation: 0,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message),
          label: '',
        ),
      ],
      onTap: (value) {
        sharedState.setpageIndex = value;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => screens[value]),
        );
      },
    );
  }
}
