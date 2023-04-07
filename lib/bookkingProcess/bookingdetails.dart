import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:guido/bookkingProcess/paymentpage.dart';
import 'package:guido/constants/colors.dart';
import 'package:guido/constants/container.dart';
import 'package:guido/constants/icons.dart';
import 'package:line_icons/line_icons.dart';

import '../constants/buttons.dart';


class BookingDetailsPage extends StatefulWidget {
  final String id = '/booking_details';
  const BookingDetailsPage({super.key});

  @override
  State<BookingDetailsPage> createState() => _BookingDetailsPageState();
}

class _BookingDetailsPageState extends State<BookingDetailsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      bottomNavigationBar:  Container(
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
          child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right:12.0),
                  child: GestureDetector(
                    onTap: () {
                      //cancel this details page
                    },
                    child: const TextShader(Text('Cancel',textScaleFactor: 0.8,style: TextStyle(color: Colors.white),)),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Start your Booking',textScaleFactor: 1.5,style: TextStyle(fontWeight: FontWeight.w300),),
                   SizedBox(height: 5,),
                  const Text('Please enter your personal details',textScaleFactor: 0.7,style: TextStyle(fontWeight: FontWeight.w300),),
                  SizedBox(height: 30,),
                  TextFormField(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                      border: OutlineInputBorder(
                        gapPadding: 0.0,
        
                      ),
                      enabledBorder: OutlineInputBorder(borderSide:  BorderSide(color: Colors.black26)),
                        focusedBorder:  OutlineInputBorder(borderSide:  BorderSide(color: Colors.black45)),
                      // hintText: 'First Name',
                      labelText: 'First Name',
                      labelStyle: TextStyle(color: Colors.black38,fontWeight: FontWeight.w300)
                                        ),
                                        cursorColor: Colors.transparent,
                                         showCursor: true,
                                         cursorWidth: 1,
                    ),
                  SizedBox(height: 20,),
                  TextFormField(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                       border: OutlineInputBorder(
                        gapPadding: 0.0,
                        
                      ),
                      enabledBorder: OutlineInputBorder(borderSide:  BorderSide(color: Colors.black26)),
                        focusedBorder:  OutlineInputBorder(borderSide:  BorderSide(color: Colors.black45)),
                      // hintText: 'Last Name',
                      labelText: 'Last Name',
                      labelStyle: TextStyle(color: Colors.black38,fontWeight: FontWeight.w300)
                                        ),
                                        cursorColor: Colors.transparent,
                                         showCursor: true,
                                         cursorWidth: 1,
                    ),
                  SizedBox(height: 20,),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                       border: OutlineInputBorder(
                        gapPadding: 0.0,
                        
                      ),
                      enabledBorder: OutlineInputBorder(borderSide:  BorderSide(color: Colors.black26)),
                        focusedBorder:  OutlineInputBorder(borderSide:  BorderSide(color: Colors.black45)),
                      // hintText: 'Last Name',
                      labelText: 'Email address',
                      labelStyle: TextStyle(color: Colors.black38,fontWeight: FontWeight.w300)
                                        ),
                                        cursorColor: Colors.transparent,
                                         showCursor: true,
                                         cursorWidth: 1,
                                        ),
                  SizedBox(height: 20,),
                  TextFormField(
                     keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                       border: OutlineInputBorder(
                        gapPadding: 0.0,
                        
                      ),
                      enabledBorder: OutlineInputBorder(borderSide:  BorderSide(color: Colors.black26)),
                        focusedBorder:  OutlineInputBorder(borderSide:  BorderSide(color: Colors.black45)),
                      // hintText: 'Last Name',
                      labelText: 'Phone Number',
                      labelStyle: TextStyle(color: Colors.black38,fontWeight: FontWeight.w300)
                                        ),
                                        cursorColor: Colors.transparent,
                                         showCursor: true,
                                         cursorWidth: 1,
                                         ),
                  SizedBox(height: 20,),
                  // TextFormField(
                  //    keyboardType: TextInputType.phone,
                  //   decoration: const InputDecoration(
                  //     contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                  //      border: OutlineInputBorder(
                  //       gapPadding: 0.0,
                        
                  //     ),
                  //     // hintText: 'Last Name',
                  //     labelText: 'Address'
                  //   ),
                  // ),
                  // SizedBox(height: 20,),
                  Row(
                    children: [
                      Flexible(
                        child: TextFormField( 
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                         border: OutlineInputBorder(
                          gapPadding: 0.0,
                        ),
                        // hintText: 'Last Name',
                        enabledBorder: OutlineInputBorder(borderSide:  BorderSide(color: Colors.black26)),
                        focusedBorder:  OutlineInputBorder(borderSide:  BorderSide(color: Colors.black45)),
                        labelText: 'Pin Code',
                        labelStyle: TextStyle(color: Colors.black38,fontWeight: FontWeight.w300)
                                        ),
                                        cursorColor: Colors.transparent,
                                         showCursor: true,
                                         cursorWidth: 1,
                                      ),
                      ),
                  SizedBox(width: 20,),
                  Flexible(
                        child: TextFormField(
                                         keyboardType: TextInputType.phone,
                                        decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                         border: OutlineInputBorder(
                          gapPadding: 0.0,
                          
                        ),
                        enabledBorder: OutlineInputBorder(borderSide:  BorderSide(color: Colors.black26)),
                        focusedBorder:  OutlineInputBorder(borderSide:  BorderSide(color: Colors.black45)),
                        // hintText: 'Last Name',
                        labelText: 'City',
                        labelStyle: TextStyle(color: Colors.black38,fontWeight: FontWeight.w300)
                                        ),
                                        cursorColor: Colors.transparent,
                                         showCursor: true,
                                         cursorWidth: 1,
                                      ),
                      ),
                    ],
                  ),
                   SizedBox(height: 20,),
                    TextFormField(
                                         keyboardType: TextInputType.phone,
                                        decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                         border: OutlineInputBorder(
                          gapPadding: 0.0,
                        ),
                        enabledBorder: OutlineInputBorder(borderSide:  BorderSide(color: Colors.black26)),
                        focusedBorder:  OutlineInputBorder(borderSide:  BorderSide(color: Colors.black45)),
                        // hintText: 'Last Name',
                        labelText: 'Country',
                         labelStyle: TextStyle(color: Colors.black38,fontWeight: FontWeight.w300)
                                        ),
                                        cursorColor: Colors.transparent,
                                         showCursor: true,
                                         cursorWidth: 1,
                                        ),
                    // FormBuilderDropdown(name: 'Country', items: const [ 
                    //   DropdownMenuItem(child: Text('India')),
                    //   DropdownMenuItem(child: Text('USA')),
                    //   // DropdownMenuItem(child: Text('China')),
                    //   // DropdownMenuItem(child: Text('Australia')),
                    // ]),
                    // SizedBox(height: 20,),
                    FormBuilderCheckbox(name: '', 
                    contentPadding: EdgeInsets.all(0),
                    controlAffinity: ListTileControlAffinity.leading,
                    
                        title: const Text(
                          'I’d like to have exclusive deals send right to my inbox',
                        textScaleFactor: 0.8,
                        ),
                        activeColor: orange,
                        ),
                      //  FormBuilderTextField(name: 'fdhg',decoration: InputDecoration(
                      //   border: OutlineInputBorder()
                      //  ),),
                      MyElevatedButton(
                          onPressed: () {
                            // check if two dates are selected
                            //and only then allow them to move to next page
                            Navigator.of(context, rootNavigator: true).push(
                                MaterialPageRoute(
                                    builder: (context) => PaymentPage()));
                          },
                          width: double.infinity,
                          borderRadius: BorderRadius.circular(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Next',
                                textScaleFactor: 1.2,
                                style: TextStyle(fontWeight: FontWeight.w300),
                              ),
                              Icon(LineIcons.angleRight,size: 16,)
                            ],
                          )
                          ),
                          const Center(child:  Padding(
                            padding:  EdgeInsets.all(8.0),
                            child: Text('You won’t be charged yet',textScaleFactor: 0.8,style: TextStyle(fontWeight: FontWeight.w200),),
                          )),
                          Column(
                            children: [
                              paywalaContainer(
                                primarytext: 'Secure data Transmission',
                                 secondarytext: 'Safe and encrypted transfer of your payments data.',
                                  icon: Icon(LineariconsFree.lock_1,
                                  color: white,),
                                  ),
                              paywalaContainer(primarytext: 'We’re here to help ',
                               secondarytext: 'High-rated customer support you can count on.',
                                icon: Icon(LineIcons.headphones,
                                color: white,
                                ),
                                )
                            ],
                          ),
                          const Padding(
                            padding:  EdgeInsets.all(12.0),
                            child: Text('We only use your data to process inquiries to inform you about our own product. You can object to the use of your e-eamil address for sending product recommendations at any time without incuring any costs other than  the transmisson......',textScaleFactor: 0.8,style: TextStyle(fontWeight: FontWeight.w300),maxLines: 3,overflow: TextOverflow.ellipsis,),
                          ),
                          const Divider(thickness: 1,height: 10,)
                ],
              ),
            ),
          ],
              ),
        )),
    );
  }
}
