import 'package:flutter/material.dart';
import 'package:guido/constants/colors.dart';

class Entrypage extends StatelessWidget {
  const Entrypage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('select sign up or log in',textAlign: TextAlign.center,),
            ElevatedButton(onPressed: ()=> Navigator.pushNamed(context, '/signup'), child: Text('signup')),
            ElevatedButton(onPressed: ()=> Navigator.pushNamed(context, '/login'), child: Text('login')),
          ],
        ),
      ),
    );
  }
}