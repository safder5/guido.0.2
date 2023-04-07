import 'package:flutter/material.dart';
import 'package:guido/constants/colors.dart';
import 'package:guido/customer_product/SettingsPages/Support/Call_Us/talktous.dart';
import 'package:guido/customer_product/navscreens/inbox.dart';

class CallUs extends StatefulWidget {
  final String id = '/call_us';
  const CallUs({super.key});

  @override
  State<CallUs> createState() => _CallUsState();
}

class _CallUsState extends State<CallUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
          child: Column(
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
                  'Need Help ?  ',
                  style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontSize: 25,
                      color: Colors.black),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: Text(
              'Feel free to call us',
              style: TextStyle(fontWeight: FontWeight.w300),
              textScaleFactor: 0.8,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),

          // cards of previous bookings do be displayed in this next list view inside the column
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'What do you need help with?',
                  textScaleFactor: 0.8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(60.0),
                      child: Text('No Bookings yet'),
                    ),
                  ],
                ),
                const Divider(
                  height: 48,
                  thickness: 1,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 24.0),
                  child: Text(
                    'Didn’t find what you were looking for?',
                    textScaleFactor: 0.9,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          // inbox page for now but later change it 
                          //to the particular chat with guido support
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InboxPage()));
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.chat_outlined,
                              size: 15,
                              color: black,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Chat With Us',
                              textScaleFactor: 0.8,
                              style: TextStyle(color: black),
                            )
                          ],
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TalkToUsePage()));
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.headphones_outlined,
                              size: 15,
                              color: black,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Talk To Us',
                              textScaleFactor: 0.8,
                              style: TextStyle(color: black),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: Row(
                    children: [
                      const Text(
                        ' You can also ',
                        textScaleFactor: 0.6,
                      ),
                      GestureDetector(
                        child: const Text(
                          'give us feedback',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.black),
                          textScaleFactor: 0.6,
                        ),
                        onTap: () {
                          //here navigator push to feedback page directly
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
