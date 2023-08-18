import 'package:flutter/material.dart';

class CustomEntryField extends StatelessWidget {
  final TextEditingController controller;
  final bool isPassword;
  final String hint;
  final keyboardType;

  const CustomEntryField(
      {required this.controller,
      this.isPassword = false,
      this.hint = "",
      this.keyboardType = TextInputType.emailAddress});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: TextField(
        keyboardType: keyboardType,

        //textAlign: TextAlign.center,
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[200]!),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(30),
          ),
          hintText: hint,
          contentPadding: EdgeInsets.all(20.0),
        ),
      ),
    );
  }
}
