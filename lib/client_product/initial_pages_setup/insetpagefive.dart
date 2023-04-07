import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guido/client_product/initial_pages_setup/insetpagesix.dart';

import '../../constants/colors.dart';
import '../../constants/icons.dart';
import '../constants /button.dart';
import '../helpPages/needHelp.dart';

class InitialSetupPageFiveDataReading extends StatefulWidget {
  const InitialSetupPageFiveDataReading({super.key});

  @override
  State<InitialSetupPageFiveDataReading> createState() =>
      _InitialSetupPageFiveDataReadingState();
}

class _InitialSetupPageFiveDataReadingState
    extends State<InitialSetupPageFiveDataReading> {
  final _auth = FirebaseAuth.instance;
  String uid = '';

  getUserID() async {
    final user = _auth.currentUser;
    try {
      if (user != null) {
        uid = user.email!;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getUserID();
    // getList();
  }

  String eventTypeforAD = '';
  String eventNameforAD = '';
  String dateEventforAD = '';
  String hoursEventforAD = '';
  String describeEventforAD = '';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('customerdata')
          .doc(uid)
          .collection('Guido$uid')
          .doc('guidoAdOne')
          .collection('events')
          .doc('eventOne')
          .snapshots(),
      builder: ((context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          // Map<String , dynamic> datatwo= snapshot.data?.data() as Map<String , dynamic>;
          return InitialSetupPageFive(
            dateEvent: dateEventforAD,
            describeEvent: describeEventforAD,
            eventName: eventNameforAD,
            eventType: eventTypeforAD,
            hoursEvent: hoursEventforAD,
          );
        } else if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.active) {
          Map<String, dynamic> data =
              snapshot.data?.data() as Map<String, dynamic>;

          return InitialSetupPageFive(
            dateEvent: data['eventDate'],
            describeEvent: data['describeEvent'],
            eventName: data['eventName'],
            eventType: data['eventType'],
            hoursEvent: data['eventHours'],
          );
          //               'eventType
          //               'eventName':
          //               'describeEvent':
          //               'eventDate'
          //               'eventHours':
        }
        return Scaffold(
          backgroundColor: white,
          body: Center(child: Text('Loading'),),
        );
      }),
    );
  }
}

class InitialSetupPageFive extends StatefulWidget {
  final String eventType;
  final String eventName;
  final String dateEvent;
  final String hoursEvent;
  final String describeEvent;
  const InitialSetupPageFive(
      {super.key,
      required this.eventType,
      required this.eventName,
      required this.dateEvent,
      required this.hoursEvent,
      required this.describeEvent});

  @override
  State<InitialSetupPageFive> createState() => _InitialSetupPageFiveState();
}

class _InitialSetupPageFiveState extends State<InitialSetupPageFive> {
  final _firestore = FirebaseFirestore.instance;
  late String uid = '';
  final _auth = FirebaseAuth.instance;
  bool dataPresent = false;

  getUserID() async {
    final user = _auth.currentUser;
    try {
      if (user != null) {
        uid = user.email!;
      }
    } catch (e) {
      print(e);
    }
    if (_firestore
            .collection('customerdata')
            .doc(uid)
            .collection('Guido$uid')
            .doc('guidoAdOne')
            .collection('events')
            .doc('eventOne')
            .snapshots() !=
        null) {
      dataPresent = true;
      // print(dataPresent);
    }
  }

  final maxLines = 5;
  @override
  void initState() {
    super.initState();
    getUserID();
  }

  String eventTypeforAD = '';
  String eventNameforAD = '';
  String dateEventforAD = '';
  String hoursEventforAD = '';
  String describeEventforAD = '';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.width * 0.28,
        width: double.infinity,
        child: Column(
          children: [
            const Divider(
              thickness: 1,
              height: 0,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      // Text('dates - , 2 guest',style: TextStyle(fontWeight: FontWeight.w300,color: Colors.black87),textScaleFactor: 0.8,),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '4/10 step',
                        style: TextStyle(
                            fontWeight: FontWeight.w300, color: Colors.black87),
                        textScaleFactor: 0.8,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // TextShader(Text('order Summary',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),textScaleFactor: 0.9,))
                    ],
                  ),
                  BorderGradientButton(
                    onPressed: () {
                      _firestore
                          .collection('customerdata')
                          .doc(uid)
                          .collection('Guido$uid')
                          .doc('guidoAdOne')
                          .collection('events')
                          .doc('eventOne')
                          .update({
                        'eventType': eventTypeforAD == ''
                            ? widget.eventType
                            : eventTypeforAD,
                        'eventName': eventNameforAD == ''
                            ? widget.eventName
                            : eventNameforAD,
                        'describeEvent': describeEventforAD == ''
                            ? widget.describeEvent
                            : describeEventforAD,
                        'eventDate': dateEventforAD == ''
                            ? widget.dateEvent
                            : dateEventforAD,
                        'eventHours': hoursEventforAD == ''
                            ? widget.hoursEvent
                            : hoursEventforAD,
                      });
                      // save the included items .......
                      // if (!isFirstTime) {
                      //   for (int i = 0; i < activities.length; i++) {
                      //     _firestore
                      //         .collection('customerdata')
                      //         .doc(Uid)
                      //         .collection('Guido$Uid')
                      //         .doc('guidoAdOne')
                      //         .collection('whatsIncluded')
                      //         .doc('$i')
                      //         .set({
                      //       'item$i': activities[i],
                      //       'detail$i': descriptions[i],
                      //     });

                      //   }
                      // }

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              InitialSetupPageSixDataReading()));
                    },
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.width * 0.15,
                    borderRadius: BorderRadius.circular(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        TextShader(Text(
                          'Next',
                          textScaleFactor: 1.2,
                          style: TextStyle(fontWeight: FontWeight.w300),
                        )),
                        IconShader(
                            icon: Icon(
                          Entypo.right_open_big,
                          size: 15,
                        ))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      backgroundColor: white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                 Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=> InitialSetupPartFourDataReading()));
                            Navigator.pop(context);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.black87,
                                  size: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NeedHelpPage()));
                            },
                            child: const Text(
                              'Need Help?',
                              style: TextStyle(
                                  color: Colors.black, fontWeight: FontWeight.w300),
                            ))
                      ],
                    ),
                     Row(
                      children: [
                        Text(
                          'GUIDO',
                          style: GoogleFonts.inter(
                              textStyle: TextStyle(fontWeight: FontWeight.w500)),
                          textScaleFactor: 1.5,
                        ),
                        TextShader(Text(
                          ' Events',
                          style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w400, color: white)),
                          textScaleFactor: 1.5,
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: const Text(
                        'Mention all your offerings in your own words and describe them briefly for your customers to get a better idea of your expertise.',
                        textScaleFactor: 0.8,
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                      width: width,
                      height: width * 0.6,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: const Image(
                          image: AssetImage('lib/images/fourthpagepic.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0, bottom: 24),
                  child: TextField(
                    controller: TextEditingController(text: widget.eventType),
                    onChanged: (value) {
                      eventTypeforAD = value;
                    },
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black26)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black45)),
                      labelText: 'Event Type',
                      labelStyle: const TextStyle(
                          color: Colors.black38, fontWeight: FontWeight.w300),
                      border:
                          OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                    ),
                    cursorColor: Colors.transparent,
                    cursorWidth: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0, bottom: 24),
                  child: TextField(
                    controller: TextEditingController(text: widget.eventName),
                    onChanged: (value) {
                      eventNameforAD = value;
                      // print(eventNameforAD);
                    },
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black26)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black45)),
                      labelText: 'Event Name',
                      labelStyle: const TextStyle(
                          color: Colors.black38, fontWeight: FontWeight.w300),
                      border:
                          OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    cursorColor: Colors.transparent,
                    cursorWidth: 1,
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                      child: TextField(
                        controller: TextEditingController(text: widget.dateEvent),
                        onChanged: (value) {
                          dateEventforAD = value;
                        },
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            // contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                            border: OutlineInputBorder(
                              gapPadding: 0.0,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black26)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black45)),
                            labelText: 'date',
                            labelStyle: TextStyle(
                                color: Colors.black38, fontWeight: FontWeight.w300)),
                        cursorColor: Colors.transparent,
                        showCursor: true,
                        cursorWidth: 1,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      child: TextFormField(
                        controller: TextEditingController(text: widget.hoursEvent),
                        onChanged: (value) {
                          hoursEventforAD = value;
                        },
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                            // contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                            border: OutlineInputBorder(
                              gapPadding: 0.0,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black26)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black45)),
                            labelText: 'hours',
                            labelStyle: TextStyle(
                                color: Colors.black38, fontWeight: FontWeight.w300)),
                        cursorColor: Colors.transparent,
                        showCursor: true,
                        cursorWidth: 1,
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 32.0),
                  child: Text(
                    'NOTE : Event will disable automatically after this time period',
                    textScaleFactor: 1.1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: SizedBox(
                    height: maxLines * 24.0,
                    child: TextField(
                      controller: TextEditingController(text: widget.describeEvent),
                      onChanged: (value) {
                        describeEventforAD = value;
                      },
                      maxLines: maxLines,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black45)),
                        border: OutlineInputBorder(),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      cursorColor: Colors.transparent,
                      showCursor: true,
                      cursorWidth: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
