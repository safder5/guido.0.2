import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guido/customer_product/navscreens/explore.dart';
import 'package:guido/customer_product/screens/afterinfopage.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../constants/buttons.dart';
import '../../constants/colors.dart';
import '../../constants/container.dart';
import '../../constants/icons.dart';
import '../constants /button.dart';

class VerifyGuidoIdentityPage extends StatefulWidget {
  const VerifyGuidoIdentityPage({super.key});

  @override
  State<VerifyGuidoIdentityPage> createState() =>
      _VerifyGuidoIdentityPageState();
}

class _VerifyGuidoIdentityPageState extends State<VerifyGuidoIdentityPage> {
  final _auth = FirebaseAuth.instance;
  String uid = '';
  bool onetime = false;

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

  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
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
                      if (!onetime) {
                        FirebaseFirestore.instance
                            .collection('guidoS')
                            .doc(uid)
                            .update(({
                              'name':uid,
                            }));
                        onetime = !onetime;
                      }

                      Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(
                          builder: (context) => AfterInfoPage()));
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
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
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
                        //takes to help page
                        //set this up later
                      },
                      child: const Text(
                        'Need Help?',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w300),
                      ))
                ],
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text(
                  'Verify your Identity',
                  textScaleFactor: 1.5,
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Please verify your ID to complete the booking process this is only one time process, no need to verify next booking time.',
                  textScaleFactor: 0.8,
                  style: TextStyle(fontWeight: FontWeight.w200),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black54),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Government ID',
                          textScaleFactor: 1.1,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Passport',
                              style: TextStyle(fontWeight: FontWeight.w300),
                            ),
                            GestureDetector(
                                child: Icon(
                              LineariconsFree.chevron_down,
                              size: 15,
                            )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black54),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Enter your passport no.', textScaleFactor: 1),
                        // SizedBox(height: 15,),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.transparent,
                          showCursor: true,
                          cursorWidth: 1,
                          decoration: const InputDecoration(
                            hintText: 'Enter Number',
                            hintStyle: TextStyle(),
                            contentPadding: EdgeInsets.all(0),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                gapPadding: 0),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                gapPadding: 0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                    child: MyElevatedButton(
                  onPressed: () {},
                  borderRadius: BorderRadius.circular(6),
                  height: 40,
                  child: const Text(
                    '   OTP   ',
                    textScaleFactor: 1.2,
                  ),
                )),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text('OTP'),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.transparent,
                    showCursor: true,
                    cursorWidth: 1,
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(),
                      contentPadding: EdgeInsets.all(8),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black38),
                          gapPadding: 4),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black38),
                          gapPadding: 4),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      ' Upload Supporting Documents',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          TextButton(
                              style: TextButton.styleFrom(
                                  foregroundColor: Colors.black87,
                                  backgroundColor:
                                      Colors.black.withOpacity(0.05)),
                              onPressed: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      LineariconsFree.file_empty,
                                      size: 15,
                                    ),
                                    Text(
                                      '  Add Documents',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                ),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          TextButton(
                              style: TextButton.styleFrom(
                                  foregroundColor: Colors.black87,
                                  backgroundColor:
                                      Colors.black.withOpacity(0.05)),
                              onPressed: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      ' Upload',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    LoadingAnimationWidget.discreteCircle(
                                        color: yellow,
                                        size: 15,
                                        secondRingColor: yellow,
                                        thirdRingColor: yellow)
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                    const Text(
                      ' Document Accepted format : PDF, Max size of per page 300kb',
                      textScaleFactor: 0.8,
                      style: TextStyle(fontWeight: FontWeight.w200),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      checkColor: white,
                      focusColor: white,
                      hoverColor: white,
                      activeColor: orange,
                      splashRadius: 0,
                      value: value,
                      onChanged: (value) {
                        setState(() {
                          this.value = value!;
                        });
                      },
                    ),
                    const Flexible(
                      child: Text(
                        'I hereby accept that “I am giving my information to guido"',
                        style: TextStyle(fontWeight: FontWeight.w300),
                        textScaleFactor: 0.8,
                      ),
                    ),
                  ],
                ),
                Text(
                  'By Clicking “Verify & Book”, you accept the T&Cs of the Guido Assist and the T&Cs of GUIDO. You can find more information on how we process your data in Our Privacy Policy. ',
                  style: TextStyle(fontWeight: FontWeight.w300),
                  textScaleFactor: 0.8,
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyElevatedButton(
                    width: double.infinity,
                    onPressed: () {},
                    child: Text(
                      'Verify & Book',
                      style: TextStyle(),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                paywalaContainer(
                    primarytext: 'Secure data Transmission',
                    secondarytext:
                        'Safe and encrypted transfer of your payments data.',
                    icon: Icon(
                      LineariconsFree.lock_1,
                      color: Colors.white,
                      size: 20,
                    )),
                paywalaContainer(
                    primarytext: 'Secure Money Transactions',
                    secondarytext: 'Safe and freely transfer of your money',
                    icon: Icon(
                      FontAwesome5.credit_card,
                      color: Colors.white,
                      size: 20,
                    )),
                SizedBox(
                  height: 20,
                ),
                Text('Why need goverment ID'),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'We only use your data to process inquiries to inform you about our own product. You can object to the use of your e-eamil address for sending product recommendations at any time without incuring any costs other than  the transmisson......',
                  textScaleFactor: 0.8,
                  style: TextStyle(fontWeight: FontWeight.w300),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 20,
                ),
                const Divider(
                  thickness: 1,
                  height: 10,
                ),
              ]),
            ],
          ),
        ),
      )),
    );
  }
}
