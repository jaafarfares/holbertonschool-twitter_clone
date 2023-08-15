import 'package:flutter/material.dart';
import 'package:twitter/widgets/bottom_bar_menu.dart';
import 'package:twitter/widgets/users_search_results_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return /* Center(child: Text('search'));  */ SafeArea(
      top: false,
      child: Scaffold(
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
          title: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const TextField(
                controller: null,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search...',
                ),
              ),
            ),
          ),
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
        body: UsersSearchResultsWidget(),
        bottomNavigationBar: BarMenu(),
      ),
    );
  }
}
