import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter/models/user.dart';
import 'package:twitter/providers/auth_state.dart';
import 'package:twitter/screens/profile_screen.dart';

class SideBarMenu extends StatefulWidget {
  const SideBarMenu({super.key});

  @override
  State<SideBarMenu> createState() => _SideBarMenuState();
}

class _SideBarMenuState extends State<SideBarMenu> {
  @override
  Widget build(BuildContext context) {
    final Auth auth = Provider.of<Auth>(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black, width: 2),
              ),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 8),
                    width: 50,
                    height: 50,
                    child: Image.asset(('asstes/logo/logo.png')),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'User Name',
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  FutureBuilder<User>(
                    future: auth.getCurrentUserModel(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error:');
                      } else if (snapshot.hasData) {
                        final currentUser = snapshot.data!;
                        return Text(
                            '${currentUser.followers} Followers   ${currentUser.following} Following');
                      } else {
                        return Text('Loading...');
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Profile'),
            onTap: () => {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => ProfileScreen(
                        )),
              ),
            },
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Lists'),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.bookmark),
            title: const Text('BookMark'),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.electric_bolt_sharp),
            title: const Text('Moments'),
            onTap: () => {},
          ),
          const Divider(
            color: Colors.black,
            thickness: 2,
          ),
          ListTile(
            title: const Text('Settings and privacy'),
            onTap: () => {},
          ),
          ListTile(
            title: const Text('Help Center'),
            onTap: () => {},
          ),
          ListTile(
            title: const Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
