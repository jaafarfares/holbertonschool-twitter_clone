import 'dart:math';

import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  PostWidget(
      {super.key,
      this.img =
          'https://upload.wikimedia.org/wikipedia/en/1/16/Crash_Bandicoot.png'});
  String img;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.blue, width: 2),
                        ),
                        width: 40,
                        height: 40,
                        child: Image.network(img, fit: BoxFit.cover),
                      ),
                      const SizedBox(width: 15),
                      const Text(
                        'Mario',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      const SizedBox(width: 10),
                      const Icon(Icons.verified, color: Colors.blue),
                      const SizedBox(width: 10),
                      const Text(
                        '@SuperMario . 1h',
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                      const SizedBox(width: 30),
                      const Icon(Icons.more_horiz, color: Colors.black),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 35, top: 20, right: 16),
                  child: Column(
                    children: [
                      Text(
                        'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentiumoptio, eaque rerum! Provident similique accusantium nemo autem. Veritatis nihil,',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Icon(Icons.chat_bubble_outline, color: Colors.grey),
                          Text('  0',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey)),
                          SizedBox(width: 20),
                          Icon(Icons.repeat, color: Colors.grey),
                          Text('  0',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey)),
                          SizedBox(width: 20),
                          Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                          Text('  2',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey)),
                          SizedBox(width: 20),
                          Spacer(),
                          Icon(Icons.share, color: Colors.grey),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
