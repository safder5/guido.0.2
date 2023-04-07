import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:guido/client_product/initial_pages_setup/insetpageone.dart';
import 'package:guido/constants/colors.dart';

import '../../constants/icons.dart';
import '../constants /button.dart';
import '../helpPages/needHelp.dart';
import 'insetpagethree.dart';

class InitialSetupPartTwoDataReading extends StatefulWidget {
  const InitialSetupPartTwoDataReading({super.key});

  @override
  State<InitialSetupPartTwoDataReading> createState() =>
      _InitialSetupPartTwoDataReadingState();
}

class _InitialSetupPartTwoDataReadingState
    extends State<InitialSetupPartTwoDataReading> {
  String daysforAD = '';
  String descriptiontwoforAD = '';
  String placesforAD = '';
  String guestsforAD = '';
  String titleforAD = '';

  late String uid = '';
  final _auth = FirebaseAuth.instance;

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
          .doc('guidoAdOne')
          .snapshots(),
      builder: ((context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          // Map<String , dynamic> datatwo= snapshot.data?.data() as Map<String , dynamic>;
          return InitialSetupPageTwo(
            days: daysforAD,
            places: placesforAD,
            descriptiontwo: descriptiontwoforAD,
            guests: guestsforAD,
            title: titleforAD,
          );
        } else if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.active) {
          Map<String, dynamic> data =
              snapshot.data?.data() as Map<String, dynamic>;
          return InitialSetupPageTwo(
            days: data['days'],
            places: data['places'],
            descriptiontwo: data['descriptiontwo'],
            guests: data['maxguests'],
            title: data['title'],
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

class InitialSetupPageTwo extends StatefulWidget {
  final String days;
  final String places;
  final String descriptiontwo;
  final String guests;
  final String title;
  const InitialSetupPageTwo(
      {super.key,
      required this.days,
      required this.places,
      required this.descriptiontwo,
      required this.guests,
      required this.title});

  @override
  State<InitialSetupPageTwo> createState() => _InitialSetupPageTwoState();
}

class _InitialSetupPageTwoState extends State<InitialSetupPageTwo> {
  String daysforAD = '';
  String descriptiontwoforAD = '';
  String placesforAD = '';
  String guestsforAD = '';
  String titleforAD = '';

  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  late String Uid = '';
  bool dataPresent = false;

  // Future<String> checkDataIfEmptyOrNot(String field) async {
  //   String dataprev = '';
  //   final ref = FirebaseFirestore.instance
  //       .collection('customerdata')
  //       .doc(Uid)
  //       .collection('Guido$Uid')
  //       .doc('guidoAdOne');
  //   //checks and returns a particular field from the document snapshot

  //   ref.get().then((DocumentSnapshot doc) async {
  //     final data = doc.data() as Map<String, dynamic>;
  //     dataprev = await data[field];
  //   });
  //   return dataprev;
  // }

  getUserID() async {
    final user = _auth.currentUser;
    try {
      if (user != null) {
        Uid = user.email!;
      }
    } catch (e) {
      print(e);
    }
    if (_firestore
            .collection('customerdata')
            .doc(Uid)
            .collection('Guido$Uid')
            .doc('guidoAdOne')
            .snapshots() !=
        null) {
      dataPresent = true;
      print(dataPresent); //find out if data ois there or not
    }
  }

  @override
  void initState() {
    super.initState();
    getUserID();
    // checkDataIfEmptyOrNot();
  }

  final maxLines = 5;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.9;
    return Scaffold(
      backgroundColor: white,
      bottomNavigationBar: SizedBox(
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
                          .doc(Uid)
                          .collection('Guido$Uid')
                          .doc('guidoAdOne')
                          .update({
                        'days': daysforAD == '' ? widget.days : daysforAD,
                        'places':
                            placesforAD == '' ? widget.places : placesforAD,
                        'descriptiontwo': descriptiontwoforAD == ''
                            ? widget.descriptiontwo
                            : descriptiontwoforAD,
                        'maxguests':
                            guestsforAD == '' ? widget.guests : guestsforAD,
                            'title':titleforAD==''?widget.title:titleforAD,
                        //                 days: data['days'],
                        // places: data['places'],
                        // descriptiontwo: data['descriptiontwo'],
                        // guests: data['numberofguests']
                        //for saetting details of this page
                      });
                      int days =
                          int.parse(daysforAD == '' ? widget.days : daysforAD);

                      // for (int i = 1; i <= days; i++) {
                      //   _firestore
                      //       .collection('customerdata')
                      //       .doc(Uid)
                      //       .collection('Guido$Uid')
                      //       .doc('daysDescribed')
                      //       .update({
                      //         'day$i':'',
                      //       });
                      // }

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => InitialSetupPageThree()));
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
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12, bottom: 0),
              child: Row(
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
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextShader(Text(
                      'Let’s Start ',
                      style: TextStyle(color: white),
                      textScaleFactor: 1.5,
                    )),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      'What you’ll Offer to costumer',
                      textScaleFactor: 1.5,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      'Describe all you offer in a clean way and mention everything you made the experience to customer , Whatever language you offer you must be know it almost intermediate level',
                      textScaleFactor: 0.8,
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      'This how you can make you adds more attractive',
                      style: TextStyle(fontWeight: FontWeight.w300),
                      textScaleFactor: 1.1,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      '\u2022 Explain what culture you made experience to costumer in brief way',
                      style: TextStyle(fontWeight: FontWeight.w300),
                      textScaleFactor: 0.9,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '\u2022 Whatever language you offer you must be know it almost intermediate level',
                      style: TextStyle(fontWeight: FontWeight.w300),
                      textScaleFactor: 0.9,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '\u2022 Whatever language you offer you must be know it almost intermediate level',
                      style: TextStyle(fontWeight: FontWeight.w300),
                      textScaleFactor: 0.9,
                    ),
                    const SizedBox(
                      height: 16,
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
                          image: AssetImage(
                              'lib/images/cottage.png'), //fourthpagepic
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      'How many days you offer',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0, bottom: 24),
                      child: TextField(
                        controller: TextEditingController(text: widget.days),
                        onChanged: (value) {
                          daysforAD = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter',
                          hintStyle: const TextStyle(
                              color: Colors.black38,
                              fontWeight: FontWeight.w300),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black26)),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black45)),
                          // labelText: '',
                          // labelStyle: const TextStyle(
                          //     color: Colors.black38,
                          //     fontWeight: FontWeight.w300),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        cursorColor: Colors.transparent,
                        cursorWidth: 1,
                      ),
                    ),
                    const Text(
                      'Title',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0, bottom: 24),
                      child: TextField(
                        maxLength: 50,
                        controller: TextEditingController(text: widget.title),
                        onChanged: (value) {
                          titleforAD = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter title example',
                          hintStyle: const TextStyle(
                              color: Colors.black38,
                              fontWeight: FontWeight.w300),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black26)),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black45)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        cursorColor: Colors.transparent,
                        cursorWidth: 1,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: SizedBox(
                        height: maxLines * 30.0,
                        child: TextField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(5)
                          ],
                          controller: TextEditingController(
                              text: widget.descriptiontwo),
                          onChanged: (value) {
                            descriptiontwoforAD = value;
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Min words : 200',
                            textScaleFactor: 0.8,
                            style: TextStyle(fontWeight: FontWeight.w300)),
                        TextShader(Text(
                          'Show Example',
                          textScaleFactor: 0.8,
                          style: TextStyle(color: white),
                        )),
                      ],
                    ),
                    const Text(
                      'Places your customer will explore on this journey',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0, bottom: 24),
                      child: TextField(
                        controller: TextEditingController(text: widget.places),
                        onChanged: (value) {
                          placesforAD = value;
                        },
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black26)),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black45)),
                          labelText: 'Places',
                          labelStyle: const TextStyle(
                              color: Colors.black38,
                              fontWeight: FontWeight.w300),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        cursorColor: Colors.transparent,
                        cursorWidth: 1,
                      ),
                    ),
                    const Text(
                      'No. of guest ',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'No. of person you allow at once ',
                      style: TextStyle(fontWeight: FontWeight.w200),
                      textScaleFactor: 0.8,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: TextEditingController(text: widget.guests),
                      onChanged: (value) {
                        guestsforAD = value;
                      },
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26)),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black45)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      cursorColor: Colors.transparent,
                      cursorWidth: 1,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Upload Experience part images',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      '\u2022 Try to upload high quality images',
                      style: TextStyle(fontWeight: FontWeight.w300),
                      textScaleFactor: 0.9,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '\u2022 Image must be 3200*2300 less than 5 MB',
                      style: TextStyle(fontWeight: FontWeight.w300),
                      textScaleFactor: 0.9,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DottedBorder(
                            // padding: const EdgeInsets.symmetric(
                            //     horizontal: 3, vertical: 24),
                            radius: const Radius.circular(10),
                            color: orange,
                            strokeWidth: 1,
                            borderType: BorderType.RRect,
                            dashPattern: const <double>[6, 6],
                            child: SizedBox(
                              width: width / 2,
                              height: width / 2,
                              // decoration: BoxDecoration(
                              //   borderRadius: BorderRadius.circular(10),
                              //   border: GradientBoxBorder(
                              //       gradient:
                              //           LinearGradient(colors: [orange, yellow])),
                              // ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child: IconShader(
                                          icon: Icon(
                                        LineariconsFree.upload,
                                        color: Colors.white,
                                        size: 30,
                                      )),
                                    ),
                                    BorderGradientButton(
                                        onPressed: () {},
                                        borderRadius: BorderRadius.circular(8),
                                        child: const TextShader(Text(
                                          'Browse',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300),
                                        ))),
                                    const Text(
                                      'Image must be PNG, JPEG',
                                      textScaleFactor: 0.8,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text('Uploaded Images : '),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      'Note : Describe all you offer in a clean way and mention everything you made the experience to customer , Whatever language you offer you must be know it almost intermediate level',
                      style: TextStyle(fontWeight: FontWeight.w300),
                      textScaleFactor: 0.8,
                    ),
                    // DottedBorder(
                    //   color: orange,
                    //   strokeWidth: 1,
                    //   borderType: BorderType.Rect,
                    //   dashPattern: [5,10],
                    //   strokeCap: StrokeCap.butt,
                    //   radius: const Radius.circular(10),
                    //   child: SizedBox(
                    //     width: width,
                    //     height: width,
                    //   ),
                    // )
                  ]),
            ),
          ],
        ),
      )),
    );
  }
}
