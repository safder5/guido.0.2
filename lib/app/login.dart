import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:guido/constants/colors.dart';

class AppLogin extends StatefulWidget {
  final String id = '/app_login';
  const  AppLogin({super.key});

  @override
  State<AppLogin> createState() => _AppLoginState();
}

class _AppLoginState extends State<AppLogin> {
  final _auth = FirebaseAuth.instance;

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        const Text('Log In'),
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
              final user = await _auth.signInWithEmailAndPassword(
                  email: email, password: password);
              try {
                if (user != null) {
                  Navigator.pushNamed(context, '/afterinfopage');
                }
              } catch (e) {
                print(e);
              }
              // print('$email +  $password');
            },
            child: const Text('Login'))
      ]),
    );
  }
}
