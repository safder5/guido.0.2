import 'package:flutter/material.dart';
import 'package:guido/bookkingProcess/bookingdetails.dart';
import 'package:guido/constants/colors.dart';
import 'package:line_icons/line_icons.dart';

import '../constants/buttons.dart';

class GuestsPickPage extends StatefulWidget {
  final String id = '/guests_pick';
  const GuestsPickPage({super.key});

  @override
  State<GuestsPickPage> createState() => _GuestsPickPageState();
}

class _GuestsPickPageState extends State<GuestsPickPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      LineIcons.arrowLeft,
                      size: 20,
                    )),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Guests ',
                  style: TextStyle(fontWeight: FontWeight.w200),
                )
              ],
            ),
          ),
          Spacer(),
           Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 30, right: 30),
              child: MyElevatedButton(
                  onPressed: () {
                    // check if two dates are selected
                    //and only then allow them to move to next page
                    Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(
                            builder: (context) => BookingDetailsPage()));
                  },
                  width: double.infinity,
                  borderRadius: BorderRadius.circular(10),
                  child: Text(
                    'Next',
                    textScaleFactor: 1.2,
                    style: TextStyle(fontWeight: FontWeight.w300),
                  )),
            )
        ],
      )
      ),
    );
  }
}
