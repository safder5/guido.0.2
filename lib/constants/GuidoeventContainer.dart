import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:guido/client_product/constants%20/button.dart';
import 'package:guido/constants/buttons.dart';

import 'colors.dart';
import 'icons.dart';

class GuidoEventContainer extends StatefulWidget {
  final String uid;
  const GuidoEventContainer({super.key, required this.uid});

  @override
  State<GuidoEventContainer> createState() => _GuidoEventContainerState();
}

class _GuidoEventContainerState extends State<GuidoEventContainer> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('customerdata')
          .doc(widget.uid)
          .collection('Guido${widget.uid}')
          .doc('guidoAdOne')
          .collection('events')
          .doc('eventOne')
          .snapshots(),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        }
        Map<String, dynamic> data =
            snapshot.data?.data() as Map<String, dynamic>;
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
              decoration: BoxDecoration(
                  border: GradientBoxBorder(
                      gradient: LinearGradient(
                    colors: [orange, yellow],
                  )),
                  borderRadius: BorderRadius.circular(10)),
              // height: MediaQuery.of(context).size.height * 0.7,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 16.0, left: 12, right: 12, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'GUIDO',
                          style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87)),
                          textScaleFactor: 1.5,
                        ),
                        TextShader(Text(
                          ' Events',
                          style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w400, color: white)),
                          textScaleFactor: 1.5,
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: width * 0.9,
                      height: width * 0.5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: const Image(
                          image: AssetImage('lib/images/fourthpagepic.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    OutlineButtonWithGradient(
                        borderRadius: BorderRadius.circular(3),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: TextShader(Text(
                            data['eventType']??'',
                            textScaleFactor: 0.8,
                            style: TextStyle(
                                fontWeight: FontWeight.w300, color: white),
                          )),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      data['eventName']??'',
                      textScaleFactor: 1,
                      style: GoogleFonts.libreBaskerville(
                          textStyle: TextStyle(fontWeight: FontWeight.w500)),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Icon(
                          Linecons.location,
                          size: 12,
                        ),
                        Text(
                          ' Kerala sumanpuri ',
                          textScaleFactor: 0.9,
                          style: GoogleFonts.inter(
                              textStyle:
                                  TextStyle(fontWeight: FontWeight.w300)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Icon(
                          LineariconsFree.calendar_full,
                          size: 12,
                        ),
                        Text(
                          data['eventData']??''+' for  '+ data['eventHours']??'' + ' hours ' ,
                          textScaleFactor: 0.9,
                          style: GoogleFonts.inter(
                              textStyle:
                                  TextStyle(fontWeight: FontWeight.w300)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Event Details',
                      textScaleFactor: 1,
                      style: GoogleFonts.inter(
                          textStyle: TextStyle(fontWeight: FontWeight.w400)),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Icon(
                          LineariconsFree.calendar_full,
                          size: 10,
                        ),
                        Text(
                          '  18+ Alllowed ',
                          textScaleFactor: 0.8,
                          style: GoogleFonts.inter(
                              textStyle:
                                  TextStyle(fontWeight: FontWeight.w300)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          RpgAwesome.knife_fork,
                          size: 10,
                        ),
                        Text(
                          '  Full Meal ',
                          textScaleFactor: 0.8,
                          style: GoogleFonts.inter(
                              textStyle:
                                  TextStyle(fontWeight: FontWeight.w300)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      data['describeEvent']??'',
                      textScaleFactor: 0.8,
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )),
        );
      },
    );
  }
}

// this has no outer padding 
// and it doesnot have gradient box border rest is same as above
class GuidoEventContainerTwo extends StatefulWidget {
  final String uid;
  const GuidoEventContainerTwo({super.key, required this.uid});

  @override
  State<GuidoEventContainerTwo> createState() => _GuidoEventContainerTwoState();
}

class _GuidoEventContainerTwoState extends State<GuidoEventContainerTwo> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('customerdata')
          .doc(widget.uid)
          .collection('Guido${widget.uid}')
          .doc('guidoAdOne')
          .collection('events')
          .doc('eventOne')
          .snapshots(),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        }
        Map<String, dynamic> data =
            snapshot.data?.data() as Map<String, dynamic>;
        return Container(
            decoration: BoxDecoration(
                border: Border.all(color: black.withOpacity(0.17),width: 0.7),
                borderRadius: BorderRadius.circular(10)),
            // height: MediaQuery.of(context).size.height * 0.7,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, left: 12, right: 12, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'GUIDO',
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black87)),
                        textScaleFactor: 1.5,
                      ),
                      TextShader(Text(
                        ' Events',
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w400, color: white)),
                        textScaleFactor: 1.5,
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: width * 0.9,
                    height: width * 0.5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: const Image(
                        image: AssetImage('lib/images/fourthpagepic.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  OutlineButtonWithGradient(
                      borderRadius: BorderRadius.circular(3),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: TextShader(Text(
                          data['eventType']??'',
                          textScaleFactor: 0.8,
                          style: TextStyle(
                              fontWeight: FontWeight.w300, color: white),
                        )),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    data['eventName']??'',
                    textScaleFactor: 1,
                    style: GoogleFonts.libreBaskerville(
                        textStyle: TextStyle(fontWeight: FontWeight.w500)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Icon(
                        Linecons.location,
                        size: 12,
                      ),
                      Text(
                        ' Kerala sumanpuri ',
                        textScaleFactor: 0.9,
                        style: GoogleFonts.inter(
                            textStyle:
                                TextStyle(fontWeight: FontWeight.w300)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Icon(
                        LineariconsFree.calendar_full,
                        size: 12,
                      ),
                      Text(
                        data['eventData']??''+' for  '+ data['eventHours']??'' + ' hours ' ,
                        textScaleFactor: 0.9,
                        style: GoogleFonts.inter(
                            textStyle:
                                TextStyle(fontWeight: FontWeight.w300)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Event Details',
                    textScaleFactor: 1,
                    style: GoogleFonts.inter(
                        textStyle: TextStyle(fontWeight: FontWeight.w400)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Icon(
                        LineariconsFree.calendar_full,
                        size: 10,
                      ),
                      Text(
                        '  18+ Alllowed ',
                        textScaleFactor: 0.8,
                        style: GoogleFonts.inter(
                            textStyle:
                                TextStyle(fontWeight: FontWeight.w300)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        RpgAwesome.knife_fork,
                        size: 10,
                      ),
                      Text(
                        '  Full Meal ',
                        textScaleFactor: 0.8,
                        style: GoogleFonts.inter(
                            textStyle:
                                TextStyle(fontWeight: FontWeight.w300)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    data['describeEvent']??'',
                    textScaleFactor: 0.8,
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ));
      },
    );
  }
}
