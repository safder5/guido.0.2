import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:guido/constants/colors.dart';

class AppSignin extends StatefulWidget {
  const AppSignin({super.key});

  @override
  State<AppSignin> createState() => _AppSigninState();
}

class _AppSigninState extends State<AppSignin> {
  final _auth = FirebaseAuth.instance;

  String email = '';

  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        const Text('Signup'),
        TextField(
          textAlign: TextAlign.center,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'email',
          ),
          onChanged: (value) => email = value,
        ),
        const Text('password'),
        TextField(
          obscureText: true,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.visiblePassword,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'password',
          ),
          onChanged: (value) => password = value,
        ),
        ElevatedButton(
            onPressed: () async {
              try {
                final newUser = await _auth.createUserWithEmailAndPassword(
                    email: email, password: password);
                if (newUser != null) {
                  Navigator.pushNamed(context, '/selection');
                }
              } catch (e) {
                print(e);
              }
              // print('$email +  $password');
            },
            child: Text('Sign Up'))
      ]),
    );
  }
}