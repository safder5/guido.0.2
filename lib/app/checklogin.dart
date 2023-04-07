import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:guido/app/opening.dart';
import 'package:guido/customer_product/screens/afterinfopage.dart';

class CheckLogin extends StatefulWidget {
  final String id = '/checklogin';

  const CheckLogin({super.key});

  @override
  State<CheckLogin> createState() => _CheckLoginState();
}

class _CheckLoginState extends State<CheckLogin> {
  final _auth = FirebaseAuth.instance;
  String loggedin = '';
  bool login = false;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    checkloggedin();
  }

  void getCurrentUser() async {
    final user = _auth.currentUser;
    User loggedinUser;
    try {  
      if (user != null) {
        loggedinUser = user;
        loggedin = loggedinUser.email!;
        // print(loggedinUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  void checkloggedin() async {
    if ( FirebaseAuth.instance.currentUser != null) {
      print(loggedin);
      login = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return login ? const AfterInfoPage() : OpeningAppPage();
  }
}
