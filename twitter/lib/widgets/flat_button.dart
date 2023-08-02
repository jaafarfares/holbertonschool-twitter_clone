import 'package:flutter/material.dart';

class CustomFlatButton extends StatelessWidget {
  const CustomFlatButton(
      {super.key,
      this.label,
      this.onPressed,
      this.fontSize = 30,
      this.fontWeight = FontWeight.normal});
  final String? label;
  final Function()? onPressed;
  final double fontSize;
  final FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          label!,
          style: TextStyle(
              color: Colors.blue,
              fontFamily: 'Raleway',
              height: 1,
              fontSize: fontSize,
              fontWeight: fontWeight),
        ));
  }
}
