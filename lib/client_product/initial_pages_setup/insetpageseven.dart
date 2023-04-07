import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guido/constants/colors.dart';

import '../../constants/icons.dart';
import '../constants /button.dart';
import '../helpPages/needHelp.dart';
import 'insetpageeight.dart';

class InitialSetupPageSevenDataReading extends StatefulWidget {
  const InitialSetupPageSevenDataReading({super.key});

  @override
  State<InitialSetupPageSevenDataReading> createState() =>
      _InitialSetupPageSevenDataReadingState();
}

class _InitialSetupPageSevenDataReadingState
    extends State<InitialSetupPageSevenDataReading> {
  final _auth = FirebaseAuth.instance;
  String uid = '';
  String days = '';
  bool firsttime = true;
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

  void getDays() {}
  @override
  void initState() {
    super.initState();
    getDays();
    getUserID();
    FirebaseFirestore.instance
        .collection('customerdata')
        .doc(uid)
        .collection('Guido$uid')
        .doc('guidoAdOne')
        .get()
        .then((value) {
      days = value.get('days');
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('customerdata')
          .doc(uid)
          .collection('Guido$uid')
          .doc('daysDescribed')
          .snapshots(),
      builder: ((context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          //             }
          // Map<String , dynamic> datatwo= snapshot.data?.data() as Map<String , dynamic>;
          return InitialSetupPageSeven(
            uid: uid,
            numberofDays: '0',
          );
        } else if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.active) {
          Map<String, dynamic> data =
              snapshot.data?.data() as Map<String, dynamic>;
          // pricebyGuidoforAD= data['pricebyGuido'] as? int?? 0  ;
          // print();
          return InitialSetupPageSeven(
            uid: uid,
            numberofDays: days,
          );
        }
       return Scaffold(
          backgroundColor: white,
          body: Center(child: Text('Loading'),),
        );
      }),
    );
  }
}

class InitialSetupPageSeven extends StatefulWidget {
  final String numberofDays;
  final String uid;
  const InitialSetupPageSeven(
      {super.key, required this.numberofDays, required this.uid});

  @override
  State<InitialSetupPageSeven> createState() => _InitialSetupPageSevenState();
}

class _InitialSetupPageSevenState extends State<InitialSetupPageSeven> {
  int days = 0;
  bool editing = false;
  String message = '';
  @override
  void initState() {
    super.initState();
    days = int.parse(widget.numberofDays);
    print(days);
  }

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
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              InitialSetupPageEightDataReading()));
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=> InitialSetupDataReading()));
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
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0, top: 8),
                child: Text(
                  'Describe Days Activity',
                  style: GoogleFonts.inter(
                      textStyle: const TextStyle(fontWeight: FontWeight.w400)),
                  textScaleFactor: 1.5,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: const Text(
                  'Mention all your offerings in your own words and describe them briefly for your customers to get a better idea of your expertise..',
                  textScaleFactor: 0.8,
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('customerdata')
                    .doc(widget.uid)
                    .collection('Guido${widget.uid}')
                    .doc('daysDescribed')
                    .snapshots(),
                builder: ((context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasError) {
                    print(snapshot.error);
                    // Map<String , dynamic> datatwo= snapshot.data?.data() as Map<String , dynamic>;
                  } else if (snapshot.hasData &&
                      snapshot.connectionState == ConnectionState.active) {
                    Map<String, dynamic> data =
                        snapshot.data?.data() as Map<String, dynamic>;

                    // pricebyGuidoforAD= data['pricebyGuido'] as? int?? 0  ;
                    // print();
                    return SingleChildScrollView(
                      // physics: ClampingScrollPhysics(),
                      child: ListView.builder(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: days,
                        itemBuilder: (BuildContext context, int index) {
                          print(data['day${index + 1}']);
                          // index = indexController;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Days ${index + 1}',
                                textScaleFactor: 1.2,
                                style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.w300)),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                  'Mention all your offerings in your own words and describe them briefly.',
                                  textScaleFactor: 0.8,
                                  style: GoogleFonts.inter(
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w300))),
                              
                              Padding(
                                padding: const EdgeInsets.only(top: 16.0),
                                child: SizedBox(
                                  height: 150.0,
                                  child: TextField(
                                    // onTap: () {
                                    //   setState(() {
                                    //     editing = true;
                                    //     print(editing);
                                    //   });
                                    // },
                                    // onSubmitted: (value) {

                                    //   message = '';
                                    // },
                                    // enabled: editing == true ? true : false,
                                    autofocus: true,

                                    controller: TextEditingController(
                                      text: data['day${index + 1}'],
                                    ),
                                    // onTap: () {
                                    //    TextPosition(
                                    //       offset: message.length);
                                    // },

                                    onChanged: (value) {
                                      message = value;
                                    },
                                    maxLines: 10,
                                    decoration: const InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black26)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black45)),
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  // GestureDetector(
                                  //   child: IconButton(
                                  //     icon: Icon(
                                  //       LineariconsFree.cross,
                                  //       color: black,
                                  //     ),
                                  //     onPressed: () {
                                  //       setState(() {
                                  //       });
                                  //     },
                                  //   ),
                                  // ),
                                  GestureDetector(
                                    child: TextButton(
                                     child: Text('Save'),//day ${index + 1}
                                      onPressed: () {
                                        setState(() {
                                          FirebaseFirestore.instance
                                            .collection('customerdata')
                                            .doc(widget.uid)
                                            .collection('Guido${widget.uid}')
                                            .doc('daysDescribed')
                                            .update(
                                                {'day${index + 1}': message});
                                        });
                                      },
                                    ),
                                  ),
                                  GestureDetector(
                                    child: OutlinedButton(
                                     child: TextShader(Text('Save')),
                                     style: OutlinedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)
                                      ),
                                      foregroundColor: Colors.white
                                     ),
                                      onPressed: () {
                                        setState(() {
                                          FirebaseFirestore.instance
                                            .collection('customerdata')
                                            .doc(widget.uid)
                                            .collection('Guido${widget.uid}')
                                            .doc('daysDescribed')
                                            .update(
                                                {'day${index + 1}': message});
                                        });
                                      },
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  }
                  return const Text('loading');
                }),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
