import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:guido/client_product/constants%20/button.dart';
import 'package:guido/client_product/helpPages/needHelp.dart';
import 'package:guido/client_product/initial_pages_setup/insetpagetwo.dart';
// import 'package:guido/client_product/initial_pages_setup/setuppageone.dart';
import 'package:guido/constants/colors.dart';
import 'package:guido/test.dart';

import '../../constants/icons.dart';

class InitialSetupDataReading extends StatefulWidget {
  const InitialSetupDataReading({super.key});

  @override
  State<InitialSetupDataReading> createState() =>
      _InitialSetupDataReadingState();
}

class _InitialSetupDataReadingState extends State<InitialSetupDataReading> {
  // final _firestore = FirebaseFirestore.instance;
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
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('customerdata')
          .doc(uid)
          .collection('Guido$uid')
          .doc('guidoAdOne')
          .snapshots(),
      builder: ((context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return InitialSetupPageOne(
              address: addressForAD,
              city: cityForAD,
              description: descriptionForAD,
              landmark: landmarkForAD,
              languages: languagesGuidoSpeaksforAD,
              pincode: pincodeForAD);
        }
        if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.active) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return InitialSetupPageOne(
            address: data['address'],
            city: data['city'],
            description: data['description'],
            landmark: data['landmark'],
            languages: data['languages'],
            pincode: data['pincode'],
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

class InitialSetupPageOne extends StatefulWidget {
  final String id = '/initial_setup_Page_one';

  final String city;
  final String address;
  final String landmark;
  final String pincode;
  final String description;
  final String languages;

  const InitialSetupPageOne(
      {super.key,
      required this.city,
      required this.address,
      required this.landmark,
      required this.pincode,
      required this.description,
      required this.languages});

  @override
  State<InitialSetupPageOne> createState() => _InitialSetupPageOneState();
}

class _InitialSetupPageOneState extends State<InitialSetupPageOne> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  late String Uid = '';
  bool dataPresent = false;

  Future<String> checkDataIfEmptyOrNot(String field) async {
    String dataprev = '';
    final ref = FirebaseFirestore.instance
        .collection('customerdata')
        .doc(Uid)
        .collection('Guido$Uid')
        .doc('guidoAdOne');

    ref.get().then((DocumentSnapshot doc) async {
      final data = doc.data() as Map<String, dynamic>;
      dataprev = await data[field];
    });
    return dataprev;
  }

  void getData() async {}

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
      print(dataPresent);
    }
  }

  String cityForAD = '';
  String addressForAD = '';
  String landmarkForAD = '';
  String pincodeForAD = '';
  String descriptionForAD = '';
  String languagesGuidoSpeaksforAD = '';

  final maxLines = 5;
  @override
  void initState() {
    super.initState();
    getUserID();
    // checkDataIfEmptyOrNot();
  }

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
                        '3/10 step',
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
                      //another idea for checking ad info

                      // if(cityForAD!=null)

                      _firestore
                          .collection('customerdata')
                          .doc(Uid)
                          .collection('Guido$Uid')
                          .doc('guidoAdOne')
                          .update({
                        'city': cityForAD == '' ? widget.city : cityForAD,
                        'address':
                            addressForAD == '' ? widget.address : addressForAD,
                        'landmark': landmarkForAD == ''
                            ? widget.landmark
                            : landmarkForAD,
                        'pincode':
                            pincodeForAD == '' ? widget.pincode : pincodeForAD,
                        'description': descriptionForAD == ''
                            ? widget.description
                            : descriptionForAD,
                        'languages': languagesGuidoSpeaksforAD == ''
                            ? widget.languages
                            : languagesGuidoSpeaksforAD,
                      });
                      _firestore.collection('guidoS').doc(Uid).update({
                        'city': cityForAD == '' ? widget.city : cityForAD,
                      });

                      // addLastPage('/initial_setup_Page_one');
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              InitialSetupPartTwoDataReading()));
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
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                                color: Colors.black,
                                fontWeight: FontWeight.w300),
                          ))
                    ],
                  ),
                  const Text(
                    'what is your region,where you\'ll give experience to the customer',
                    textScaleFactor: 1.5,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'You must be available at select place at booked time',
                    textScaleFactor: 0.7,
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0, bottom: 24),
                    child: TextField(
                      controller: TextEditingController(text: widget.city),
                      onChanged: (value) {
                        cityForAD = value;
                      },
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26)),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black45)),
                        labelText: 'City',
                        labelStyle: const TextStyle(
                            color: Colors.black38, fontWeight: FontWeight.w300),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      cursorColor: Colors.transparent,
                      cursorWidth: 1,
                    ),
                  ),
                  const Text(
                    'Where you will meet to costumer ',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0, bottom: 24),
                    child: TextField(
                      controller: TextEditingController(text: widget.address),
                      onChanged: (value) {
                        addressForAD = value;
                        print(addressForAD);
                      },
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26)),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black45)),
                        labelText: 'Address',
                        labelStyle: const TextStyle(
                            color: Colors.black38, fontWeight: FontWeight.w300),
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
                          controller:
                              TextEditingController(text: widget.landmark),
                          onChanged: (value) {
                            landmarkForAD = value;
                          },
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              // contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                              border: OutlineInputBorder(
                                gapPadding: 0.0,
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black26)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black45)),
                              labelText: 'Landmark',
                              labelStyle: TextStyle(
                                  color: Colors.black38,
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
                          controller:
                              TextEditingController(text: widget.pincode),
                          onChanged: (value) {
                            pincodeForAD = value;
                          },
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                              // contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                              border: OutlineInputBorder(
                                gapPadding: 0.0,
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black26)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black45)),
                              labelText: 'Pin Code',
                              labelStyle: TextStyle(
                                  color: Colors.black38,
                                  fontWeight: FontWeight.w300)),
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
                      'Discribe how costumer can reach on your place after reach in your city',
                      textScaleFactor: 1.1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: SizedBox(
                      height: maxLines * 24.0,
                      child: TextField(
                        controller:
                            TextEditingController(text: widget.description),
                        onChanged: (value) {
                          descriptionForAD = value;
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
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 32.0, right: 64, bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text('Language you offer to customer '),
                        const SizedBox(
                          height: 6,
                        ),
                        const Text(
                          'Whatever language you offer you must be know it almost intermediate level',
                          style: TextStyle(fontWeight: FontWeight.w300),
                          textScaleFactor: 0.7,
                        )
                      ],
                    ),
                  ),
                  TextFormField(
                    controller: TextEditingController(text: widget.languages),
                    onChanged: (value) {
                      languagesGuidoSpeaksforAD = value;
                    },
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          gapPadding: 0.0,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black45)),
                        labelText: 'Languages',
                        labelStyle: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w300)),
                    cursorColor: Colors.transparent,
                    showCursor: true,
                    cursorWidth: 1,
                  ),
                ],
              ),
            ),
            // const Divider(thickness: 1,height: 10,)
          ],
        ),
      )),
    );
  }
}
