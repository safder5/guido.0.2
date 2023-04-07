import 'dart:ui';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:guido/bookkingProcess/verifypage.dart';
import 'package:guido/constants/colors.dart';
import 'package:guido/constants/container.dart';
import 'package:guido/constants/icons.dart';
import 'package:line_icons/line_icons.dart';

import '../constants/buttons.dart';

class PaymentPage extends StatefulWidget {
  final String id = '/payment_page';
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {

  // const TextShader learnmore = TextShader(Text('Learn More.',style: TextStyle(color: Colors.white),));
    //  TextShader learnmore= TextShader(Text('Learn More',textScaleFactor: 0.7,style:  TextStyle(color: Colors.white),));
    return Scaffold(
    
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.width * 0.28,
        width: double.infinity,
        child: Column(
          children: [
            const Divider(thickness: 1,height: 0,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const  [
                      Text('dates - , 2 guest',style: TextStyle(fontWeight: FontWeight.w300,color: Colors.black87),textScaleFactor: 0.8,),
                      SizedBox(
                        height: 5,
                      ),
                      Text('5,049 INR total'),
                      SizedBox(
                        height: 10,
                      ),
                      TextShader(Text('order Summary',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),textScaleFactor: 0.9,))
                    ],
                  ),
                  MyElevatedButton(onPressed: (){}, 
                  width: MediaQuery.of(context).size.width * 0.24,
                  borderRadius: BorderRadius.circular(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Pay',
                                  textScaleFactor: 1.2,
                                  style: TextStyle(fontWeight: FontWeight.w300),
                                ),
                                Icon(LineIcons.angleRight,size: 16,)
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select payment method',
                textScaleFactor: 1.5,
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.12,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black26)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.12,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black26)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.12,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black26)),
                ),
              ),
              SizedBox(height: 30,),
              const Text('Cancellation policy'),
              SizedBox(height: 20,),
              Wrap(
                children:const  [
                   Text(
                    'Free cancellation before date. Cancel before last date before for a partial refund.',
                    textScaleFactor: 0.7,
                    style: TextStyle(color: Colors.black45),
                  ),
                  TextShader(Text('Learn More.',textScaleFactor: 0.7,style: TextStyle(color: Colors.white,decoration: TextDecoration.underline),)),
                ],
              ),
              SizedBox(height: 20,),
              const Text('Terms & Conditions'),
              SizedBox(height: 20,),
              const Text(
                'A contract with the guido comes into effect after the successful completion of your booking . The confirmation e-mail and invoice for your booking will the then be sent to you by GUIDO .',
                textScaleFactor: 0.7,
                style: TextStyle(color: Colors.black45),
              ),
              SizedBox(height: 20,),
              Wrap(
                alignment: WrapAlignment.start,
                // verticalDirection: VerticalDirection.,
                // runAlignment: WrapAlignment.spaceBetween,
                children: const [
                  Text('By Clicking “confirm and pay”, you accept the T&Cs of the Guido Assist and the T&Cs of GUIDO. You can find more information on how we process your data in Our', textScaleFactor: 0.8,
                style: TextStyle(color: Colors.black45),),
                TextShader(Text(' Privacy Policy ',textScaleFactor: 0.8,style: TextStyle(color: Colors.white,),)),
                // Text(' of the Guido Assist and Guido ', textScaleFactor: 0.7,
                // style: TextStyle(color: Colors.black45),),
                ],
              ),
               SizedBox(height: 25,),
               MyElevatedButton(
                          onPressed: () {
                            // check if two dates are selected
                            //and only then allow them to move to next page
                            Navigator.of(context, rootNavigator: true).push(
                                MaterialPageRoute(
                                    builder: (context) => VerifyPage()));
                          },
                          width: double.infinity,
                          borderRadius: BorderRadius.circular(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Confirm and Pay',
                                textScaleFactor: 1.2,
                                style: TextStyle(fontWeight: FontWeight.w300),
                              ),
                              Icon(LineIcons.angleRight,size: 16,)
                            ],
                          )
                          ),
                          SizedBox(height: 20,),
                          paywalaContainer(primarytext: 'Secure data Transmission', secondarytext: 'Safe and encrypted transfer of your payments data.', icon: Icon(LineariconsFree.lock_1,color: Colors.white,size: 20,)),
                          paywalaContainer(primarytext: 'Secure Money Transactions', secondarytext: 'Safe and freely transfer of your money', icon: Icon(FontAwesome5.credit_card,color: Colors.white,size: 20,)),
                          const Padding(
                            padding:  EdgeInsets.all(12.0),
                            child: Text('We only use your data to process inquiries to inform you about our own product. You can object to the use of your e-eamil address for sending product recommendations at any time without incuring any costs other than  the transmisson......',textScaleFactor: 0.8,style: TextStyle(fontWeight: FontWeight.w300),maxLines: 3,overflow: TextOverflow.ellipsis,),
                          ),
                          const Divider(thickness: 1,height: 10,),
            ],
          ),
        ),
      )),
    );
  }
}

