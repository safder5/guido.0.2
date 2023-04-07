import 'package:flutter/material.dart';
import 'package:guido/constants/colors.dart';

class HowGuidoWorksPage extends StatefulWidget {
   final String id = '/howguidoworks';
   const HowGuidoWorksPage({super.key});

  @override
  State<HowGuidoWorksPage> createState() => _HowGuidoWorksPageState();
}

class _HowGuidoWorksPageState extends State<HowGuidoWorksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: yellow,
    );
  }
}
