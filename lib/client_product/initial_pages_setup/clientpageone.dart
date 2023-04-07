import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:guido/app/opening.dart';
import 'package:guido/client_product/initial_pages_setup/setuppageone.dart';
import 'package:guido/constants/colors.dart';

class ClientPageOne extends StatefulWidget {
  final String id = '/client_page_one';
  const ClientPageOne({super.key});

  @override
  State<ClientPageOne> createState() => _ClientPageOneState();
}

class _ClientPageOneState extends State<ClientPageOne> {
    final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {
                   _auth.signOut();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OpeningAppPage()));
                  },
                  icon: Icon(Icons.logout)),
            ],
          ),
          Center(child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> CreateGuidoDataInitials() ));
            },
            child: Text('enter setup mode'),
          ),)
        ],
      )),
    );
  }
}
