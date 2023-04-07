import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:guido/constants/colors.dart';

class SetupAccount extends StatefulWidget {
  const SetupAccount({super.key});

  @override
  State<SetupAccount> createState() => _SetupAccountState();
}

class _SetupAccountState extends State<SetupAccount> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  String name = '';

  String sendermail = '';
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    final user = await _auth.currentUser;
    User loggedinUser;
    try {
      if (user != null) {
        loggedinUser = user;
        sendermail = loggedinUser.email!;
        print(loggedinUser.email);
      }
    } catch (e) {
      print(e);
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
              'enter personal information for becoming a Guido',
              textAlign: TextAlign.center,
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                icon: Icon(Icons.person),
                hintText: 'enter first name',
                labelText: '',
              ),
              onChanged: (value) => name = value,
            ),
          ],
        ),
      ),
    );
  }
}
