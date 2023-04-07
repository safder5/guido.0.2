import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guido/client_product/banksPaymentSetup/bankDetailsSetPage.dart';
import 'package:guido/client_product/banksPaymentSetup/upiSetPage.dart';
import 'package:guido/client_product/banksPaymentSetup/verifyIdentityForGuido.dart';

import '../../constants/colors.dart';
import '../../constants/icons.dart';
import '../constants /button.dart';

class BankingPageOneDataReading extends StatefulWidget {
  const BankingPageOneDataReading({super.key});

  @override
  State<BankingPageOneDataReading> createState() =>
      _BankingPageOneDataReadingState();
}

class _BankingPageOneDataReadingState extends State<BankingPageOneDataReading> {
  @override
  Widget build(BuildContext context) {
    return BankingPageOne();
  }
}

class BankingPageOne extends StatefulWidget {
  const BankingPageOne({super.key});

  @override
  State<BankingPageOne> createState() => _BankingPageOneState();
}

class _BankingPageOneState extends State<BankingPageOne> {
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
                              fontWeight: FontWeight.w300,
                              color: Colors.black87),
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
                            builder: (context) => VerifyGuidoIdentityPage()));
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
            Text(
              'Bank & UPI Details ',
              textScaleFactor: 1.4,
              style: GoogleFonts.inter(
                  textStyle: const TextStyle(fontWeight: FontWeight.w400)),
            ),
            const SizedBox(
              height: 40,
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> BankDetailsPage()));
                  },
                  child: Container(
                    width: width*0.9,
                    height: width/6,
                    child: Row(children: [
                      // Icon(FontAwesome5.piggy_bank),
                      SizedBox(width: 20,),
                      Text('Bank Details')]),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black.withOpacity(0.23))
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> UpiSetupPage()));
                  },
                  child: Container(
                    width: width*0.9,
                    height: width/6,
                    child: Row(children: [
                      // Icon(FontAwesome5.piggy_bank),
                      SizedBox(width: 20,),
                      Text('UPI Details')]),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black.withOpacity(0.23))
                    ),
                  ),
                )
              ],
            )
          ]),
        ))));
  }
}
