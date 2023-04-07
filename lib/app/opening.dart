import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:guido/app/login.dart';
import 'package:guido/constants/colors.dart';



class OpeningAppPage extends StatefulWidget {
  final String id = '/opening';

  @override
  State<OpeningAppPage> createState() => _OpeningAppPageState();
}

class _OpeningAppPageState extends State<OpeningAppPage> {
  final _auth = FirebaseAuth.instance;
  String loggedin = '';
  bool login = false;
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

 void Signout(){
 //
 }
  void getCurrentUser() async {
    final user = await _auth.currentUser;
    User loggedinUser;
    try {
      if (user != null) {
        loggedinUser = user;
        loggedin = loggedinUser.email!;
        print(loggedinUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  void checkloggedin() async {
    if (await FirebaseAuth.instance.currentUser != null) {
      print(loggedin);
      login = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'select sign up or log in',
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/signup'),
                child: Text('signup')),
            ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, AppLogin().id),
                child: Text('login')),
          ],
        ),
      ),
    );
  }
}
