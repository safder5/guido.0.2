import 'package:flutter/material.dart';
import 'package:guido/constants/colors.dart';

class Box extends StatelessWidget {
  final String text;
  final bool active;
  const Box(this.text, {super.key, required this.active});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          color: trans,
          width: MediaQuery.of(context).size.width * 0.25,
          child: TextField(
            enabled: false,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                hintText: text,
                border: OutlineInputBorder(borderSide: BorderSide())),
          )),
    );
  }
}
