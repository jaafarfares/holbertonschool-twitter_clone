import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
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
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextField(
                          decoration: InputDecoration(
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

// Bio TextField
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Bio',
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
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
