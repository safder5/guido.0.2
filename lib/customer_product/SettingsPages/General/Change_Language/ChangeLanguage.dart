// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:guido/constants/colors.dart';
import 'package:guido/constants/icons.dart';

class ChangeLanguagePage extends StatefulWidget {
  final String id = '/changelanguage';
  
   const ChangeLanguagePage({super.key});

  @override
  State<ChangeLanguagePage> createState() => _ChangeLanguagePageState();
}

class _ChangeLanguagePageState extends State<ChangeLanguagePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Icon(
                      Icons.arrow_back,
                      size: 15,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 24.0, top: 24),
                  child: Text(
                    'Change Language ',
                    style: TextStyle(fontWeight: FontWeight.w100, fontSize: 25),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.04,),
             Padding(padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: const Text('Current',style: TextStyle(fontWeight: FontWeight.w500),),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                   Text('English',style: TextStyle(),textScaleFactor: 1,),
                   IconShader(icon: Icon(Icons.check_circle_outline,color: Colors.white,))
                  ],
                ),
                const Text('United States',textScaleFactor: 0.5,),
                const Divider(thickness: 1,height: 24,)
              ],
            ),
            ),
        ],
      )),
    );
  }
}
