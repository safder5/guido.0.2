import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:guido/constants/colors.dart';
import 'package:guido/constants/icons.dart';
import 'package:guido/customer_product/Search/searchcitiesBar.dart';
import 'package:guido/feedpages/feedAd.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter/services.dart' as rootBundle;

import 'dart:math' as math;

import '../../models/citiesdataModel.dart';
import '../Search/searchAdList.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 24.0, left: 12, right: 12, bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text('Good morning,'),
                TextShader(Text(
                  'safder! ',
                  style: TextStyle(color: white),
                )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(children: [
              Text(
                'Where do you ',
                style: GoogleFonts.libreBaskerville(
                    textStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600)),
                textScaleFactor: 2,
              ),
              TextShader(Text(
                'want',
                style: GoogleFonts.libreBaskerville(
                    textStyle: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600)),
                textScaleFactor: 2,
              ))
            ]),
            Row(
              children: [
                TextShader(Text(
                  'to ',
                  style: GoogleFonts.libreBaskerville(
                      textStyle: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600)),
                  textScaleFactor: 2,
                )),
                Text(
                  'go?',
                  style: GoogleFonts.libreBaskerville(
                      textStyle: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600)),
                  textScaleFactor: 2,
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: () {
                // showSearch(context: context, delegate: PageSearchDelegate());
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SearchLoader()));
              },
              child: Hero(
                tag: 'search',
                child: AbsorbPointer(
                  child: Container(
                    decoration: BoxDecoration(
                        border: GradientBoxBorder(
                          gradient: LinearGradient(colors: [orange, yellow]),
                          width: 0.7,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.rotationY(math.pi),
                              child: const Icon(
                                LineIcons.search,
                                color: Colors.black,
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          // SizedBox(
                          //   width: MediaQuery.of(context).size.width/1.5,
                          //   height: MediaQuery.of(context).size.height*0.02,
                          //   child: TextField(
                          //     decoration: InputDecoration(
                          //       border: InputBorder.none,
                          //       hintText: 'Any culture  Any week  Any guest',
                          //       hintStyle:  : TextStyle(color: Colors.black38),
                          //     ),
                          //   ))
                          // const Text(
                          //   'Any culture  Any week  Any guest',
                          //   textScaleFactor: 0.7,
                          //   style: TextStyle(color: Colors.black38),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.56,
                child: const FeedAdList()),
            // SizedBox(
            //   height: 10,
            // ),
            // Expanded(child: FeedAdList())
          ],
        ),
      ),
    );
  }
}

class TweenScreen extends StatelessWidget {
  const TweenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Hero(
        tag: 'search',
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
                border: GradientBoxBorder(
                  gradient: LinearGradient(colors: [orange, yellow]),
                  width: 0.7,
                ),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(math.pi),
                        child: Icon(
                          LineariconsFree.cross,
                          size: 20,
                          color: Colors.black.withOpacity(0.7),
                        )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Material(
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width / 1.5,
                          height: MediaQuery.of(context).size.height * 0.035,
                          child: TextField(
                            cursorColor: Colors.black12,
                            decoration:
                                InputDecoration(border: InputBorder.none),
                            cursorWidth: 0.5,
                            onChanged: (value) {},
                          ))),
                  Spacer(),
                  GestureDetector(
                    child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(math.pi),
                        child: Icon(
                          LineIcons.search,
                          size: 20,
                          color: Colors.black.withOpacity(0.7),
                        )),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  )
                  // Container(
                  //     decoration: BoxDecoration(
                  //         border: Border.all(color: grey),
                  //         shape: BoxShape.circle),
                  //     child: const Padding(
                  //       padding: EdgeInsets.all(3.0),
                  //       child: Icon(
                  //         Icons.tune_rounded,
                  //         size: 15,
                  //       ),
                  //     ))
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}

