import 'package:flutter/material.dart';
import 'package:twitter/providers/auth_state.dart';
import 'package:twitter/widgets/flat_button.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final auth = Auth();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() async {
    final userModel = await auth.getCurrentUserModel();
    setState(() {
      _nameController.text = userModel.displayName ?? '';
      _bioController.text = userModel.bio ?? '';
    });
  }

  Future<void> _updateUserProfile() async {
    final String newName = _nameController.text;
    final String newBio = _bioController.text;

    try {
      await auth.updateUserProfile(newName, newBio, context);
    } catch (error) {
      print('Error updating user profile: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 170.0,
                color: Colors.blue[900],
                child: Center(
                    /*     child: Image.network(
                    'https://www.toynk.com/cdn/shop/articles/How-Many-Super-Mario-Games-are-there.jpg?v=1648640966&width=1500',
                    fit: BoxFit.contain,
                  ), */
                    ),
              ),
              SizedBox(height: 45),
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
                        TextField(
                          controller: _nameController,
                          decoration: const InputDecoration(
                            labelText: 'Name',
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: _bioController,
                          decoration: const InputDecoration(
                            labelText: 'Bio',
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: CustomFlatButton(
                            fontWeight: FontWeight.bold,
                            label: 'Submit',
                            onPressed: _updateUserProfile,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 115.0,
            left: 20.0,
            right: 20.0,
            child: Row(
              children: [
                Container(
                  height: 110.0,
                  width: 110.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 6.0,
                    ),
                  ),
                  child: ClipOval(
                    child: Stack(
                      children: [
                        Image.network(
                          "https://cdn.pocket-lint.com/r/s/1200x/assets/images/153339-games-news-does-mario-sunbathing-pic-mean-mario-sunshine-for-switch-is-near-image1-9zsg71zrml.jpg",
                          fit: BoxFit.cover,
                        ),
                        Container(
                          color: Colors.black
                              .withOpacity(0.3), // Adjust opacity as needed
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 140.0,
            left: 30.0,
            right: 270.0,
            child: IconButton(
              icon: const Icon(
                Icons.camera_alt_outlined,
                color: Colors.white,
                size: 40,
              ),
              onPressed: () {},
            ),
          ),
          Positioned(
            top: 50.0,
            left: 50.0,
            right: 50.0,
            child: IconButton(
              icon: const Icon(
                Icons.camera_alt_outlined,
                color: Colors.white,
                size: 40,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
