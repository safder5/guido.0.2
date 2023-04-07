import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:guido/client_product/initial_pages_setup/insetpageseven.dart';
import 'package:guido/constants/colors.dart';

import '../../constants/icons.dart';
import '../constants /button.dart';
import '../helpPages/needHelp.dart';

class InitialSetupPageSixDataReading extends StatefulWidget {
  const InitialSetupPageSixDataReading({super.key});

  @override
  State<InitialSetupPageSixDataReading> createState() =>
      _InitialSetupPageSixDataReadingState();
}

class _InitialSetupPageSixDataReadingState
    extends State<InitialSetupPageSixDataReading> {
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

  int pricebyGuidoforAD = 0;

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
          return InitialSetupPageSix(
            Price: 0,
          );
        } else if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.active) {
          Map<String, dynamic> data =
              snapshot.data?.data() as Map<String, dynamic>;
          // pricebyGuidoforAD= data['pricebyGuido'] as? int?? 0  ;
          // print();
          return InitialSetupPageSix(
            Price: int.parse(data['pricebyGuido']),
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

class InitialSetupPageSix extends StatefulWidget {
  final int Price;
  const InitialSetupPageSix({super.key, required this.Price});

  @override
  State<InitialSetupPageSix> createState() => _InitialSetupPageSixState();
}

class _InitialSetupPageSixState extends State<InitialSetupPageSix> {
  double fees = 0;
  double gst = 0;
  double earnings = 0;
  final _auth = FirebaseAuth.instance;
  String uid = '';
  int price = 0;
  // TextEditingController priceController = TextEditingController(text: '0');

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

  void getPrice() {
    price = widget.Price;
    fees = price / 10;
    gst = fees / 100 * 18;
    earnings = price - fees - gst;
    print(price);
    //  price = widget.Price as int;
  }

  @override
  void initState() {
    super.initState();
    getPrice();
    getUserID();
    // getList();
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
                      FirebaseFirestore.instance
                          .collection('customerdata')
                          .doc(uid)
                          .collection('Guido$uid')
                          .doc('guidoAdOne')
                          .update(
                              {'pricebyGuido': price == 0 ? '0' : '$price'});
                      // next button changes prices to database
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              InitialSetupPageSevenDataReading()));
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
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    // height: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: GradientBoxBorder(
                          gradient: LinearGradient(colors: [orange, yellow])),
                    ),
                    padding: EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextShader(Text(
                              '10%',
                              textScaleFactor: 3,
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w100)),
                            )),
                            Container(
                                width: width * 0.25,
                                // height: width*0.25,
                                child: Text('Fees Charges per booking',
                                    style: GoogleFonts.inter(
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.w200))))
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                            '10% Fees Charge per booking and on 10% charge 18% GST will charge fees Charge per booking',
                            textScaleFactor: 0.8,
                            style: GoogleFonts.inter(
                                textStyle:
                                    TextStyle(fontWeight: FontWeight.w200))),
                        SizedBox(
                          height: 15,
                        ),
                        Text('Here\'s how it works:',
                            style: GoogleFonts.inter(
                                textStyle:
                                    TextStyle(fontWeight: FontWeight.w400))),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                            '\u2022 \$0-\$500 in earnings from a client: 20% service fee applied to earnings',
                            textScaleFactor: 0.8,
                            style: GoogleFonts.inter(
                                textStyle:
                                    TextStyle(fontWeight: FontWeight.w300))),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                            '\u2022 \$0-\$500.01-\$10,000 in earnings from a client: 10% service fee',
                            textScaleFactor: 0.8,
                            style: GoogleFonts.inter(
                                textStyle:
                                    TextStyle(fontWeight: FontWeight.w300))),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                            '\u2022 \$10,000.01 or more in earnings from a client: 5% service fee',
                            textScaleFactor: 0.8,
                            style: GoogleFonts.inter(
                                textStyle:
                                    TextStyle(fontWeight: FontWeight.w300))),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                            'For example : On a \$600 project with a new client, your freelancer service fee would be 20% on the first \$500 and 10% on the remaining \$100. Your earnings after fees would be \$490',
                            textScaleFactor: 0.8,
                            style: GoogleFonts.inter(
                                textStyle:
                                    TextStyle(fontWeight: FontWeight.w200))),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                            ' Note : On a \$600 project with a new client, your freelancer service fee would be 20% on the first \$500 and 10% on the remaining \$100. Your earnings after fees would be \$490',
                            textScaleFactor: 0.8,
                            style: GoogleFonts.inter(
                                textStyle:
                                    TextStyle(fontWeight: FontWeight.w200))),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Prices',
                        textScaleFactor: 1.5,
                      ),
                      Text(
                          'Payments you get after deduction charges will calculate automatically at next step!',
                          textScaleFactor: 0.8,
                          style: GoogleFonts.inter(
                              textStyle:
                                  TextStyle(fontWeight: FontWeight.w200))),
                      TextField(
                        controller: TextEditingController(text: ''), // left
                        onChanged: (value) {
                          if (value != null) {
                            price = int.parse(value);
                            fees = price / 10;
                            gst = fees / 100 * 18;
                            gst.floorToDouble();
                            earnings = price - fees - gst;
                            print(price);
                          }
                        },
                        decoration: InputDecoration(hintText: '$price'),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        cursorColor: Colors.transparent,
                        showCursor: true,
                        cursorWidth: 1,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {});
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(bottom: 16.0),
                          child: Icon(LineariconsFree.checkmark_cicle),
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    // height: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black54, width: 0.5),
                    ),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Guido fees (10%)',
                              style: GoogleFonts.inter(textStyle: TextStyle()),
                              textScaleFactor: 1.2,
                            ),
                            Text(
                              '\u{20B9}  $fees',
                              style: GoogleFonts.inter(textStyle: TextStyle()),
                              textScaleFactor: 1.2,
                            )
                          ],
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'GST on 10%',
                              style: GoogleFonts.inter(textStyle: TextStyle()),
                              textScaleFactor: 1.2,
                            ),
                            Text(
                              '\u{20B9}  $gst',
                              style: GoogleFonts.inter(textStyle: TextStyle()),
                              textScaleFactor: 1.2,
                            )
                          ],
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Your earnings after fees would be : ₹ $earnings ',
                          style: GoogleFonts.inter(
                              textStyle: TextStyle(color: Color(0xFF187827))),
                          textScaleFactor: 1,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Note : This is not a last payments you get ',
                            textScaleFactor: 0.8,
                            style: GoogleFonts.inter(
                                textStyle:
                                    TextStyle(fontWeight: FontWeight.w200))),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        )),
      )),
    );
  }
}
