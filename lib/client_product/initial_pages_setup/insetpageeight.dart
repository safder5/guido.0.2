import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guido/client_product/banksPaymentSetup/bankingpageone.dart';
import 'package:guido/constants/colors.dart';
import 'package:material_dialogs/dialogs.dart';

import '../../constants/icons.dart';
import '../constants /button.dart';
import '../helpPages/needHelp.dart';

class InitialSetupPageEightDataReading extends StatefulWidget {
  const InitialSetupPageEightDataReading({super.key});

  @override
  State<InitialSetupPageEightDataReading> createState() =>
      _InitialSetupPageEightDataReadingState();
}

class _InitialSetupPageEightDataReadingState
    extends State<InitialSetupPageEightDataReading> {
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
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('customerdata')
          .doc(uid)
          .collection('Guido$uid')
          .doc('aboutYou')
          .snapshots(),
      builder: ((context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return InitialSetupPageEight(
            addressGovnDocs: '',
            education: '',
            occupation: '',
            personalDetails: '',
            city: '',
            pinCode: '',
            uid: uid,
          );
        } else if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.active) {
          Map<String, dynamic> data =
              snapshot.data?.data() as Map<String, dynamic>;
          return InitialSetupPageEight(
            uid: uid,
            pinCode: data['pinCode'],
            addressGovnDocs: data['addressGovnDocs'],
            city: data['city'],
            education: data['education'],
            personalDetails: data['personalDetails'],
            occupation: data['occupation'],
          );
        }
        return Scaffold(
          backgroundColor: white,
          body: Center(
            child: Text('Loading'),
          ),
        );
      }),
    );
  }
}

class InitialSetupPageEight extends StatefulWidget {
  final String personalDetails;
  final String addressGovnDocs;
  final String pinCode;
  final String city;
  final String education;
  final String occupation;
  final String uid;
  const InitialSetupPageEight(
      {super.key,
      required this.personalDetails,
      required this.addressGovnDocs,
      required this.pinCode,
      required this.city,
      required this.education,
      required this.occupation,
      required this.uid});

  @override
  State<InitialSetupPageEight> createState() => _InitialSetupPageEightState();
}

class _InitialSetupPageEightState extends State<InitialSetupPageEight> {
  String personalDetails = '';
  String addressGovnDocs = '';
  String pinCode = '';
  String city = '';
  String education = '';
  String occupation = '';
  String number = '';
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
                      FirebaseFirestore.instance
                          .collection('customerdata')
                          .doc(widget.uid)
                          .collection('Guido${widget.uid}')
                          .doc('aboutYou')
                          .update({
                        'personalDetails': personalDetails == ''
                            ? widget.personalDetails
                            : personalDetails,
                        'addressGovnDocs': addressGovnDocs == ''
                            ? widget.addressGovnDocs
                            : addressGovnDocs,
                        'pinCode': pinCode == '' ? widget.pinCode : pinCode,
                        'education':
                            education == '' ? widget.education : education,
                        'city': city == '' ? widget.city : city,
                        'occupation':
                            occupation == '' ? widget.occupation : occupation,
                      });
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              BankingPageOneDataReading()));
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
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Icon(
                        Icons.arrow_back,
                        color: Colors.black87,
                        size: 15,
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
            Text(
              'About you ',
              textScaleFactor: 1.4,
              style: GoogleFonts.inter(
                  textStyle: const TextStyle(fontWeight: FontWeight.w400)),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: width * 0.9,
              child: const Text(
                'Describe all you offer in a clean way and mention everything you made the experience to customer , Whatever language you offer you must be know it almost intermediate level',
                textScaleFactor: 0.8,
                style: TextStyle(fontWeight: FontWeight.w200),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: grey,
                      minRadius: 40,
                    ),
                    const SizedBox(
                      width: 60,
                      height: 60,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: ClipRect(
                          child: Image(
                            image: AssetImage('lib/images/profilepic.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: width / 2,
                        child: const Text(
                          'We recommend an image of at least 512x512 for the space',
                          textScaleFactor: 0.8,
                          style: TextStyle(fontWeight: FontWeight.w200),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    BorderGradientButton(
                      onPressed: () {}, // upload image sheets to be added
                      width: width * 0.25,
                      height: width * 0.1,
                      borderRadius: BorderRadius.circular(6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          TextShader(Text(
                            'Upload',
                            style: TextStyle(fontWeight: FontWeight.w300),
                          )),
                          // IconShader(
                          //     icon: Icon(
                          //   Entypo.right_open_big,
                          //   size: 15,
                          // ))
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: width * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'You must highlight these things',
                    textScaleFactor: 1.1,
                    style: GoogleFonts.inter(
                        textStyle:
                            const TextStyle(fontWeight: FontWeight.w300)),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                      ' \u2022  Explain what culture you made experience to costumer in brief way',
                      textScaleFactor: 0.8,
                      style: GoogleFonts.inter(
                          textStyle:
                              const TextStyle(fontWeight: FontWeight.w300))),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                      ' \u2022  Whatever language you offer you must be know it almost intermediate level',
                      textScaleFactor: 0.8,
                      style: GoogleFonts.inter(
                          textStyle:
                              const TextStyle(fontWeight: FontWeight.w300))),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0, bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 150.0,
                    child: TextField(
                      controller:
                          TextEditingController(text: widget.personalDetails),
                      onChanged: (value) {
                        personalDetails = value;
                      },
                      maxLines: 10,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26)),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black45)),
                        hintText: 'Describe Yourself as a Cultural Indian. ',
                        labelStyle: const TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w300,
                            fontSize: 14),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      cursorColor: Colors.transparent,
                      cursorWidth: 1,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Min 150 words',
                    textScaleFactor: 0.7,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0, bottom: 24),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: TextEditingController(text: ''),
                onChanged: (value) {
                  number = value;
                },
                decoration: InputDecoration(
                  suffix: GestureDetector(
                    child: Text(
                      ' OTP',
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 16),
                    ),
                    onTap: () {
                      setState(() {
                        // start OTP process

                        Dialogs.materialDialog(
                            // msg:
                            //     'e.g. - activities you will personally provide the customer',
                            // msgAlign: TextAlign.center,
                            // title: "OTP verification",
                            color: Colors.white,
                            context: context,
                            actions: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'OTP verification',
                                    textScaleFactor: 1.4,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    width: width / 3,
                                    child: Text(
                                      'Enter the OTP sent to ${number}',
                                      textScaleFactor: 0.8,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'RESEND OTP',
                                      textScaleFactor: 0.8,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              )
                            ]);
                      });
                    },
                  ),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black26)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black45)),
                  labelText: 'Phone Number',
                  labelStyle: const TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.w300,
                      fontSize: 14),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                cursorColor: Colors.transparent,
                cursorWidth: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0, bottom: 24),
              child: TextField(
                controller: TextEditingController(text: widget.addressGovnDocs),
                onChanged: (value) {
                  addressGovnDocs = value;
                },
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black26)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black45)),
                  labelText: 'Address as per Govt. Id',
                  labelStyle: const TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.w300,
                      fontSize: 14),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                cursorColor: Colors.transparent,
                cursorWidth: 1,
              ),
            ),
            Row(
              children: [
                Flexible(
                  child: TextField(
                    controller: TextEditingController(text: widget.pinCode),
                    onChanged: (value) {
                      pinCode = value;
                    },
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          gapPadding: 0.0,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black45)),
                        labelText: 'Postal Code',
                        labelStyle: TextStyle(
                            color: Colors.black38,
                            fontSize: 14,
                            fontWeight: FontWeight.w300)),
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
                    controller: TextEditingController(text: widget.city),
                    onChanged: (value) {
                      city = value;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          gapPadding: 0.0,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black45)),
                        labelText: 'City',
                        labelStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.black38,
                            fontWeight: FontWeight.w300)),
                    cursorColor: Colors.transparent,
                    showCursor: true,
                    cursorWidth: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Education',
                  textScaleFactor: 1.2,
                  style: GoogleFonts.inter(
                      textStyle: const TextStyle(fontWeight: FontWeight.w300)),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: width * 0.8,
                  child: Text(
                      ' Explain what culture you made experience to costumer in brief way',
                      textScaleFactor: 0.8,
                      style: GoogleFonts.inter(
                          textStyle:
                              const TextStyle(fontWeight: FontWeight.w300))),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, bottom: 24),
                  child: TextField(
                    controller: TextEditingController(text: widget.education),
                    onChanged: (value) {
                      education = value;
                    },
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black26)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black45)),
                      labelText: 'Education',
                      labelStyle: const TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w300,
                          fontSize: 14),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    cursorColor: Colors.transparent,
                    cursorWidth: 1,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Occupation',
                  textScaleFactor: 1.2,
                  style: GoogleFonts.inter(
                      textStyle: const TextStyle(fontWeight: FontWeight.w300)),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: width * 0.8,
                  child: Text(
                      ' Explain what culture you made experience to costumer in brief way',
                      textScaleFactor: 0.8,
                      style: GoogleFonts.inter(
                          textStyle:
                              const TextStyle(fontWeight: FontWeight.w300))),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, bottom: 24),
                  child: TextField(
                    controller: TextEditingController(text: widget.occupation),
                    onChanged: (value) {
                      occupation = value;
                    },
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black26)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black45)),
                      labelText: 'Occupation',
                      labelStyle: const TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w300,
                          fontSize: 14),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    cursorColor: Colors.transparent,
                    cursorWidth: 1,
                  ),
                ),
              ],
            ),
          ]),
        ),
      )),
    );
  }
}
