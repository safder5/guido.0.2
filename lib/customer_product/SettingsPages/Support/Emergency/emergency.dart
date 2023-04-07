import 'package:flutter/material.dart';
import 'package:guido/constants/colors.dart';
import 'package:guido/customer_product/SettingsPages/Support/Emergency/helpemergency.dart';

class EmergancyPage extends StatefulWidget {
  final String id = '/emergency';
  const EmergancyPage({super.key});

  @override
  State<EmergancyPage> createState() => _EmergancyPageState();
}

class _EmergancyPageState extends State<EmergancyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
            Padding(
              padding: EdgeInsets.all(24),
              child: Text(
                'Are you in Emergency ?',
                style: TextStyle(fontWeight: FontWeight.w100, fontSize: 32),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 24),
              child: Text(
                'Press the button below and help will reach you soon.',
                textScaleFactor: 0.9,
              ),
            ),
          ]),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HelpEmergencyPage()));
              },
              child: const Padding(
                padding: EdgeInsets.all(50.0),
                child: CircleAvatar(
                    backgroundColor: Colors.redAccent,
                    radius: 80,
                    child: Center(
                        child: Text(
                      'Help Me!',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 25),
                    ))),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Cancel'),
                  ],
                )),
          )
        ],
      )),
    );
  }
}
