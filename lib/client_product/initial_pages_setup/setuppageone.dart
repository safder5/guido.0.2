import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:guido/client_product/constants%20/clientapptexts.dart';
import 'package:guido/client_product/initial_pages_setup/insetpageone.dart';
import 'package:guido/constants/buttons.dart';
import 'package:guido/constants/colors.dart';
import 'package:guido/constants/icons.dart';

// addLastPage(String last) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.setString('resumepage', last);
// }

// removelastpage() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.remove('resumepage');
// }

// getLastPage() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String? resumepage = prefs.getString('resumepage');
//   return resumepage;
// }

class CreateGuidoDataInitials extends StatefulWidget {
  final String id = '/create_initial_guido_data';
  const CreateGuidoDataInitials({super.key});

  @override
  State<CreateGuidoDataInitials> createState() =>
      _CreateGuidoDataInitialsState();
}

class _CreateGuidoDataInitialsState extends State<CreateGuidoDataInitials> {
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

  late String uid = '';

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
          .snapshots(),
      builder: ((context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.active) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          String guido = data['guido'];
          return SetupPageOne(
            checkifGuido: guido,
          );
        }
        return const Text('loading');
      }),
    );
    ;
  }
}

class SetupPageOne extends StatefulWidget {
  final String checkifGuido;
  final String id = '/setup_page_one';
  const SetupPageOne({super.key, required this.checkifGuido});

  @override
  State<SetupPageOne> createState() => _SetupPageOneState();
}

class _SetupPageOneState extends State<SetupPageOne> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  // String checkifGuido() {
  //   StreamBuilder<DocumentSnapshot>(
  //     stream: FirebaseFirestore.instance
  //         .collection('customerdata')
  //         .doc(uid)
  //         .snapshots(),
  //     builder: ((context, AsyncSnapshot<DocumentSnapshot> snapshot) {
  //       if (snapshot.hasData &&
  //           snapshot.connectionState == ConnectionState.active) {
  //         Map<String, dynamic> data =
  //             snapshot.data!.data() as Map<String, dynamic>;
  //         String guido = data['guido'];
  //         return guido;
  //       }
  //       return const Text('loading');
  //     }),
  //   );
  // }

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

  String cityForAD = '';
  String addressForAD = '';
  String landmarkForAD = '';
  String pincodeForAD = '';
  String descriptionForAD = '';
  String languagesGuidoSpeaksforAD = '';

  late String uid = '';
  @override
  void initState() {
    super.initState();
    getUserID();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Make',
                  style: bigboldlibre,
                  textScaleFactor: 1.6,
                ),
                TextShader(Text(
                  ' experience',
                  style: GoogleFonts.libreBaskerville(
                      textStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600)),
                  textScaleFactor: 1.6,
                )),
                Text(
                  ' better',
                  style: bigboldlibre,
                  textScaleFactor: 1.6,
                )
              ],
            ),
          ),
          Text(
            'with Guido!',
            style: bigboldlibre,
            textScaleFactor: 1.6,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              // height: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: GradientBoxBorder(
                    gradient: LinearGradient(colors: [orange, yellow])),
              ),
              padding: EdgeInsets.all(30),
              child: Column(children: [
                const ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: Image(
                    image: AssetImage('lib/images/guidoimageforsetup.png'),
                    // width: width,
                    // height: height * 0.81,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextShader(Text(
                    'Lets be a part of Guido',
                    style: bigboldlibrreWhite,
                    textScaleFactor: 1.3,
                  )),
                ),
                Text(
                  'Here we have to discribe why you have to join guido and how much you will earns by it! statement from a person who is going to do a job for you, for example a builder or a painter, telling you how much it will cost',
                  style: tinylighttext,
                  textAlign: TextAlign.center,
                  textScaleFactor: 1,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Average Earning',
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      ' ₹2000 ',
                      style: GoogleFonts.inter(
                          textStyle: TextStyle(fontWeight: FontWeight.w500)),
                      textScaleFactor: 2.5,
                    ),
                    Text(
                      'per trip',
                      style: GoogleFonts.inter(
                          textStyle: TextStyle(fontWeight: FontWeight.w300)),
                      textScaleFactor: 1.6,
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Learn how to estimate earrnings',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w200),
                    textScaleFactor: 0.8,
                  ),
                ),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Easy Setup',
                      style: GoogleFonts.inter(),
                      textScaleFactor: 1.4,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 30,
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Text(
                    'Setup is required to explain what you offer to host, About you and payments system.',
                    style: GoogleFonts.inter(
                        textStyle: TextStyle(fontWeight: FontWeight.w200)),
                    textScaleFactor: 0.8,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      ContainerSetupsteps(
                          stepnumber: '1',
                          title: 'What you’ll offer ',
                          subtitle:
                              'Setup is required to explain what you offer to host, About you and payments system.statement from a person who is going to do a job for you, for example a builder or a painter, telling you how much it will cost'),
                      ContainerSetupsteps(
                          stepnumber: '2',
                          title: 'About you',
                          subtitle:
                              'Setup is required to explain what you offer to host, About you and payments system.statement from a person who is going to do a job for you, for example a builder or a painter, telling you how much it will cost'),
                      ContainerSetupsteps(
                          stepnumber: '3',
                          title: 'Payments',
                          subtitle:
                              'Setup is required to explain what you offer to host, About you and payments system.statement from a person who is going to do a job for you, for example a builder or a painter, telling you how much it will cost')
                    ],
                  ),
                ),
                MyElevatedButton(
                    width: double.infinity,
                    borderRadius: BorderRadius.circular(10),
                    onPressed: () async {
                      // addLastPage('/setup_page_one');
                      // removelastpage();

                      // Navigator.pushNamed(context, await getLastPage());
                      // StreamBuilder<DocumentSnapshot>(
                      //   stream: FirebaseFirestore.instance
                      //       .collection('customerdata')
                      //       .doc(uid)
                      //       .snapshots(),
                      //   builder: ((context,
                      //       AsyncSnapshot<DocumentSnapshot> snapshot) {
                      //     if (snapshot.hasData &&
                      //         snapshot.connectionState ==
                      //             ConnectionState.active) {
                      //       Map<String, dynamic> data =
                      //           snapshot.data!.data() as Map<String, dynamic>;
                      //       String guido = data['guido'];
                      //       return guido;
                      //     }
                      //     return const Text('loading');
                      //   }),
                      // );

                      if (widget.checkifGuido == 'no') {
                        _firestore
                            .collection('customerdata')
                            .doc(uid)
                            .collection('Guido$uid')
                            .doc('daysDescribed')
                            .set({});

                        _firestore
                            .collection('customerdata')
                            .doc(uid)
                            .collection('Guido$uid')
                            .doc('aboutYou')
                            .set({
                              'personalDetails':'',
                              'addressGovnDocs':'',
                              'pinCode':'',
                              'city':'',
                              'education':'',
                              'occupation':'',
                            });

                        _firestore
                            .collection('customerdata')
                            .doc(uid)
                            .collection('Guido$uid')
                            .doc('guidoAdOne')
                            .set({
                          'city': '',
                          'address': '',
                          'landmark': '',
                          'pincode': '',
                          'description': '',
                          'languages': '',
                          'days': '',
                          'places': '',
                          'descriptiontwo': '',
                          'maxguests': '',
                          'pricebyGuido': '0',
                          'title':'',
                          // 'pricebyGuido': int.parse('0'),
                        });

                        _firestore
                            .collection('customerdata')
                            .doc(uid)
                            .collection('Guido$uid')
                            .doc('guidoAdOne')
                            .collection('events')
                            .doc('eventOne')
                            .set({
                          'eventType': '',
                          'eventName': '',
                          'describeEvent': '',
                          'eventDate': '',
                          'eventHours': ''
                        });

                        _firestore
                            .collection('customerdata')
                            .doc(uid)
                            .collection('Guido$uid')
                            .doc('guidoAdOne')
                            .collection('whatsIncluded')
                            .doc('items')
                            .set({});

                        _firestore.collection('customerdata').doc(uid).update({
                          'guido': 'yes',
                        });
                      }

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InitialSetupDataReading()));
                      // InitialSetupPageOne(city: '', address: '', landmark: '', pincode: '', description: '', languages: '')
                    },
                    child: Text('Guido Setup')),
              ],
            ),
          ),
        ]),
      )),
    );
  }
}
