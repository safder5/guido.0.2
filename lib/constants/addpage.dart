import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:guido/bookkingProcess/dateselection.dart';
import 'package:guido/constants/GuidoeventContainer.dart';
import 'package:guido/constants/buttons.dart';
import 'package:guido/constants/colors.dart';
import 'package:guido/constants/container.dart';
import 'package:guido/constants/icons.dart';
import 'package:line_icons/line_icons.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}

class AddPage extends StatefulWidget {
  final String uid;
  final String title;
  final String address;
  final String city;
  final String days;
  final String languages;
  final String guests;
  final String price;
  final String descriptionMap;
  final String descriptiontwo;
  const AddPage(
      {super.key,
      required this.title,
      required this.address,
      required this.city,
      required this.days,
      required this.languages,
      required this.guests,
      required this.price,
      required this.descriptionMap,
      required this.descriptiontwo,
      required this.uid});

  @override
  State<AddPage> createState() => _AddPageState();
}

final Uri _url = Uri.parse('https://www.youtube.com/watch?v=orlUDdeoxZQ');

class _AddPageState extends State<AddPage> {
  int length = 0;
  double count = 0.0;
  String x = 'aljsebc';
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height * 0.6;
    return Scaffold(
      backgroundColor: white,
      bottomNavigationBar: Container(
        width: width,
        height: MediaQuery.of(context).size.height * 0.12,
        decoration: BoxDecoration(
          color: white,
        ),
        child: Column(
          children: [
            Divider(
              thickness: 0.5,
              height: 0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 12.0, left: 25, right: 25, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tue, 3/21 - Sat, 3/25',
                        textScaleFactor: 0.8,
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text('\u{20B9} to be decided '),
                          Text(
                            'total',
                            textScaleFactor: 0.9,
                          )
                        ],
                      ),
                      Text(
                        '\u{20B9} ${widget.price}/ person',
                        textScaleFactor: 0.8,
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Cash breakdown',
                        textScaleFactor: 0.6,
                        style: TextStyle(decoration: TextDecoration.underline),
                      )
                    ],
                  ),
                  // ElevatedButton(onPressed: (){}, child: Text('Book now'),style: ButtonStyle(),)
                  MyElevatedButton(
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).push(
                          MaterialPageRoute(
                              builder: (context) => DateSelectionPage()));
                    },
                    child: Text('Pick Dates'),
                    borderRadius: BorderRadius.circular(5),
                    height: MediaQuery.of(context).size.height * 0.04,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: width,
              height: height,
              child: Stack(children: [
                ListView(
                    // dragStartBehavior: DragStartBehavior.down,
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(
                        height: height,
                        width: width,
                        child: const ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          child: Image(
                            image: AssetImage('lib/images/pic.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height,
                        width: width,
                        child: const ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          child: Image(
                            image: AssetImage('lib/images/pic.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height,
                        width: width,
                        child: const ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          child: Image(
                            image: AssetImage('lib/images/pic.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ]),
                SafeArea(
                  child: Container(
                    color: trans,
                    width: width,
                    height: height / 3,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: CircleAvatar(
                                  backgroundColor: black.withOpacity(0.3),
                                  radius: 15,
                                  child: Icon(
                                    LineariconsFree.arrow_left,
                                    color: white,
                                    size: 15,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ]),
            ),
            SizedBox(
              height: 10,
            ),
            // part one
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20, top: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      OutlineButtonWithGradient(
                          borderRadius: BorderRadius.circular(3),
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: TextShader(Text(
                              '+Accomodation',
                              textScaleFactor: 0.8,
                              style: TextStyle(
                                  fontWeight: FontWeight.w300, color: white),
                            )),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      OutlineButtonWithGradient(
                          borderRadius: BorderRadius.circular(3),
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: TextShader(Text(
                              'Guido Event',
                              textScaleFactor: 0.8,
                              style: TextStyle(
                                  fontWeight: FontWeight.w300, color: white),
                            )),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.title,
                    textScaleFactor: 1.2,
                    style: GoogleFonts.libreBaskerville(textStyle: TextStyle()),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      IconShader(
                          icon: Icon(
                        Icons.star,
                        color: white,
                        size: 15,
                      )),
                      Text(
                        '4.2/5(56)',
                        textScaleFactor: 0.8,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Icon(
                        Linecons.location,
                        size: 16,
                      ),
                      Text(
                        widget.city + ' ' + widget.address,
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(fontWeight: FontWeight.w300)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text('\u{20B9}6000 '),
                      Text(
                        'total',
                        textScaleFactor: 0.9,
                      )
                    ],
                  ),
                  Text(
                    '\u{20B9}${widget.price} / person',
                    textScaleFactor: 0.8,
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),

            // part two
            // Padding(
            //   padding: const EdgeInsets.only(
            //       left: 20.0, right: 20, top: 10, bottom: 10),
            //   child: Column(
            //     children: [
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Container(
            //                   width: width * 0.7,
            //                   child: Text(
            //                     'Festival experiences hosted by safder',
            //                     softWrap: false, maxLines: 1,
            //                     overflow: TextOverflow.fade,
            //                     textScaleFactor: 1,
            //                     style: TextStyle(fontWeight: FontWeight.w500),
            //                     //  style: GoogleFonts.libreBaskerville(textStyle: TextStyle())
            //                   )),
            //               Text(
            //                 '2 days ',
            //                 textScaleFactor: 0.6,
            //               ),
            //             ],
            //           ),
            //           CircleAvatar(
            //             radius: 20,
            //             backgroundColor: grey,
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            // const Divider(
            //   thickness: 1,
            //   indent: 20,
            //   endIndent: 20,
            // ),
            //part three
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20, top: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'What\'ll host offer you ',
                    textScaleFactor: 1,
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.descriptiontwo,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    textScaleFactor: 0.85,
                    style: TextStyle(fontWeight: FontWeight.w300),
                  )
                ],
              ),
            ),
            // const Divider(
            //   thickness: 1,
            //   indent: 20,
            //   endIndent: 20,
            // ),
            GuidoEventContainer(
              uid: widget.uid,
            ),
            //part four
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20, top: 10, bottom: 10),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Text(
                        'Overview',
                        textScaleFactor: 1.1,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      )
                      // create a 1/2 which idk
                    ],
                  ),
                  SizedBox(
                    height: 160,
                    child: StreamBuilder<DocumentSnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('customerdata')
                          .doc(widget.uid)
                          .collection('Guido${widget.uid}')
                          .doc('guidoAdOne')
                          .collection('whatsIncluded')
                          .doc('items')
                          .snapshots(),
                      builder:
                          (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.black,
                            ),
                          );
                        }
                        Map<String, dynamic> data =
                            snapshot.data?.data() as Map<String, dynamic>;
                        count = data.length / 2.round();
                        length = count.toInt();
                        return ListView.builder(
                            // shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: length,
                            itemBuilder: (BuildContext context, int index) {
                              return OverviewSmallContainer(
                                  headText: data['name$index'] ?? '',
                                  subText: data['detail$index'] ?? '',
                                  icon: Icon(
                                    Icons.food_bank_outlined,
                                    color: white,
                                  ));
                            });
                      },
                    ),
                  ),
                ],
              ),
            ),
            //part six

            StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('customerdata')
                  .doc(widget.uid)
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
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20, top: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: grey,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data['name'] ?? '',
                                  textScaleFactor: 1.1,
                                  style:
                                      TextStyle(fontWeight: FontWeight.w400)),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  IconShader(
                                      icon: Icon(
                                    Icons.star,
                                    color: white,
                                    size: 12,
                                  )),
                                  IconShader(
                                      icon: Icon(
                                    Icons.star,
                                    color: white,
                                    size: 12,
                                  )),
                                  IconShader(
                                      icon: Icon(
                                    Icons.star,
                                    color: white,
                                    size: 12,
                                  )),
                                  IconShader(
                                      icon: Icon(
                                    Icons.star,
                                    color: white,
                                    size: 12,
                                  )),
                                  IconShader(
                                      icon: Icon(
                                    Icons.star,
                                    color: white,
                                    size: 12,
                                  )),
                                  Text(
                                    '4.7/5 (56)',
                                    textScaleFactor: 0.6,
                                  )
                                ],
                              ),
                            ],
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: IconShader(
                                icon: Icon(
                              Octicons.comment,
                              color: white,
                              size: 30,
                            )),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20, top: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: width * 0.4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'From',
                                  style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w200)),
                                ),
                                Text(
                                  data['adress'] ?? '',
                                  style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w400)),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: width * 0.4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Languages ',
                                  style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w200)),
                                ),
                                Text(
                                  widget.languages,
                                  style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w400)),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            // RatingBar.builder(
            //   itemSize: 12,
            //   initialRating: 3,
            //   minRating: 1,
            //   direction: Axis.horizontal,
            //   allowHalfRating: true,
            //   itemCount: 5,
            //   itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            //   itemBuilder: (context, _) => Icon(
            //     Icons.star,
            //     color: orange,size: 5,
            //   ),
            //   onRatingUpdate: (rating) {
            //     print(rating);
            //   },
            // ),

            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20, top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: width * 0.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Member since',
                          style: GoogleFonts.inter(
                              textStyle:
                                  TextStyle(fontWeight: FontWeight.w200)),
                        ),
                        Text(
                          'Jul 2020',
                          style: GoogleFonts.inter(
                              textStyle:
                                  TextStyle(fontWeight: FontWeight.w400)),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: width * 0.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Avg.response time',
                          style: GoogleFonts.inter(
                              textStyle:
                                  TextStyle(fontWeight: FontWeight.w200)),
                        ),
                        Text(
                          '1 hour',
                          style: GoogleFonts.inter(
                              textStyle:
                                  TextStyle(fontWeight: FontWeight.w400)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              indent: 16,
              endIndent: 16,
              // thickness: 1,
            ),
            StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('customerdata')
                    .doc(widget.uid)
                    .collection('Guido${widget.uid}')
                    .doc('aboutYou')
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
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20, top: 10, bottom: 10),
                    child: Column(
                      children: [
                        Text(
                          data['personalDetails'] ?? '',
                          overflow: TextOverflow.ellipsis,
                          textScaleFactor: 0.85,
                          maxLines: 4,
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  );
                }),
            //  const Divider(thickness: 1,indent: 20,endIndent: 20,),
            //part seven
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20, top: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Here We’ll Meet',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black26, width: 0.5),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: _launchUrl,
                            child: SizedBox(
                              width: width / 4,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: const Image(
                                  image: AssetImage(
                                      'lib/images/mapImage.png'), //fourthpagepic
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'New Delhi',
                                  textScaleFactor: 1,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                    width: 120,
                                    child: Text(
                                      'Sector 18, Delhi road, Delhi - 110002, IN',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300),
                                      textScaleFactor: 0.8,
                                    ))
                              ],
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              LineariconsFree.map,
                              size: 20,
                              color: Colors.black26,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10),
              child: Text(
                widget.descriptionMap,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                ),
                textScaleFactor: 0.9,
              ),
            ),
            // const Divider(
            //   thickness: 1,
            //   indent: 20,
            //   endIndent: 20,
            // ),
            //part eight
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20, top: 20, bottom: 10),
              child: Row(
                children: [
                  Text(
                    'Reviews',
                    textScaleFactor: 1.2,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  IconShader(
                      icon: Icon(
                    Icons.star,
                    color: white,
                    size: 15,
                  )),
                  Text(
                    '4.2',
                    style: TextStyle(fontWeight: FontWeight.w500),
                    textScaleFactor: 0.8,
                  ),
                  Text(
                    '(56)',
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: Colors.black38),
                    textScaleFactor: 0.8,
                  ),
                  Spacer(),
                  Text(
                    'See all',
                    textScaleFactor: 0.8,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.28,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: [
                          ReviewCard('Aryan kabir'),
                          ReviewCard('Robin Das'),
                          ReviewCard('Manhaa'),
                          ReviewCard('Rohit'),
                          ReviewCard('Naman Pratap'),
                        ],
                      )),
                ),
                //part nine
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20, top: 20, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Availability & Guests',
                        textScaleFactor: 1.2,
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Color(0xFF187827).withOpacity(0.09)),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            'Selected dates are available',
                            textScaleFactor: 0.85,
                            style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    color: Color(0xFF30703A),
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 0.5,
                                color: Colors.black.withOpacity(0.23)),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              Icon(
                                LineariconsFree.calendar_full,
                                color: Colors.black.withOpacity(0.23),
                                size: 20,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Tue, 3/21 - Sat, 3/25',
                                textScaleFactor: 0.9,
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w300),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 0.5,
                                color: Colors.black.withOpacity(0.23)),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.person_2_outlined,
                                color: Colors.black.withOpacity(0.23),
                                size: 20,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                '3 People',
                                textScaleFactor: 0.9,
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w300),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Costs',
                    textScaleFactor: 1.2,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        'Pricer for 4 Days × 3 Guest',
                        textScaleFactor: 0.9,
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                      Spacer(),
                      Text('\u{20B9} 24,000 ',
                          textScaleFactor: 0.9,
                          style: TextStyle(fontWeight: FontWeight.w300))
                    ],
                  )
                ],
              ),
            ),
            Container(
              color: black.withOpacity(0.04),
              width: width,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Total ',
                          textScaleFactor: 1.2,
                        ),
                        Icon(
                          Icons.info_outlined,
                          size: 14,
                          color: black.withOpacity(0.4),
                        )
                      ],
                    ),
                    // SizedBox(height: 20,),
                    Row(
                      children: [
                        Text(
                          'Including taxes and fees',
                          textScaleFactor: 0.9,
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                        Spacer(),
                        Text('\u{20B9} 24,864  ',
                            textScaleFactor: 0.9,
                            style: TextStyle(fontWeight: FontWeight.w300))
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextShader(Text(
                    'Cost Breakdown',
                    textScaleFactor: 0.9,
                    style: TextStyle(color: white, fontWeight: FontWeight.w300),
                  )),
                ],
              ),
            ),
            Divider(
              thickness: 0.5,
              indent: 20,
              endIndent: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Cancellation policy'),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'A cancellation 0 to 60 days before check-in will a charge pf 100% of the booking value.',
                    textScaleFactor: 0.8,
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextShader(Text(
                    'More detail',
                    textScaleFactor: 0.9,
                    style: TextStyle(color: white, fontWeight: FontWeight.w300),
                  )),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Icon(Icons.report_problem_outlined,
                          size: 16, color: black.withOpacity(0.4)),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Report this ad',
                        style: TextStyle(
                            color: black.withOpacity(0.4),
                            decoration: TextDecoration.underline),
                      )
                    ],
                  )
                ],
              ),
            ),
            //part ten
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Similar adds',
                      style: TextStyle(fontWeight: FontWeight.w500),
                      textScaleFactor: 0.9),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: [
                          Cardforsearchpage(
                            const Text(
                              'From \$70 / person',
                              style: TextStyle(fontWeight: FontWeight.w500),
                              textScaleFactor: 0.5,
                            ),
                            Text(
                              'A trail to the Manalis\' unseen beauty',
                              style: GoogleFonts.libreBaskerville(
                                  textStyle: const TextStyle()),
                              textScaleFactor: 0.8,
                            ),
                            const Text(
                              'full meal and bed',
                              textScaleFactor: 0.5,
                            ),
                            imageUrl: 'lib/images/place1.png',
                          ),
                          Cardforsearchpage(
                            const Text(
                              'From \$42 / person',
                              style: TextStyle(fontWeight: FontWeight.w500),
                              textScaleFactor: 0.5,
                            ),
                            Text(
                              'Most beautiful view points with our package',
                              style: GoogleFonts.libreBaskerville(
                                  textStyle: const TextStyle()),
                              textScaleFactor: 0.8,
                            ),
                            const Text(
                              'Full 3 time meal',
                              textScaleFactor: 0.5,
                            ),
                            imageUrl: 'lib/images/place1.png',
                          ),
                          Cardforsearchpage(
                            const Text(
                              'From \$70 / person',
                              style: TextStyle(fontWeight: FontWeight.w500),
                              textScaleFactor: 0.5,
                            ),
                            Text(
                              'A trail to the Manalis\' unseen beauty',
                              style: GoogleFonts.libreBaskerville(
                                  textStyle: const TextStyle()),
                              textScaleFactor: 0.8,
                            ),
                            const Text(
                              'full meal and bed',
                              textScaleFactor: 0.5,
                            ),
                            imageUrl: 'lib/images/place1.png',
                          ),
                        ],
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


  //     Container(
                  //       width: width * 0.25,
                  //       child: GradientBoxwithIcon(
                  //         text0: Text(
                  //           'Food',
                  //           textScaleFactor: 0.8,
                  //         ),
                  //         text1: Text(
                  //           'Full three times local food which will perpared at home by host...read more',
                  //           textScaleFactor: 0.6,
                  //           maxLines: 3,
                  //           overflow: TextOverflow.fade,
                  //         ),
                  //         icon: Icon(
                  //           Icons.food_bank_outlined,
                  //           color: white,
                  //         ),
                  //       ),
                  //     ),

                  // GestureDetector(
                  //   onTap: () {},
                  //   child: Container(
                  //     width: width,
                  //     decoration: BoxDecoration(
                  //       color: white,
                  //       borderRadius: BorderRadius.circular(10),
                  //       border: GradientBoxBorder(
                  //         gradient: LinearGradient(colors: [orange, yellow]),
                  //         width: 0.7,
                  //       ),
                  //     ),
                  //     child: Center(
                  //       child: Padding(
                  //         padding: const EdgeInsets.only(top: 15, bottom: 15),
                  //         child: TextShader(Text(
                  //           'Contact Host',
                  //           textScaleFactor: 1.4,
                  //           style: TextStyle(
                  //               color: white, fontWeight: FontWeight.w200),
                  //         )),
                  //       ),
                  //     ),
                  //   ),
                  // )