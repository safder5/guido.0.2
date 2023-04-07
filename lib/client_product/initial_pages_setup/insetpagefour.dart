import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:guido/client_product/initial_pages_setup/insetpagefive.dart';
import 'package:guido/constants/colors.dart';
import 'package:guido/constants/icons.dart';
import 'package:material_dialogs/material_dialogs.dart';

import '../constants /button.dart';
import '../helpPages/needHelp.dart';

class InitialSetupPartFourDataReading extends StatefulWidget {
  const InitialSetupPartFourDataReading({super.key});

  @override
  State<InitialSetupPartFourDataReading> createState() =>
      _InitialSetupPartFourDataReadingState();
}

class _InitialSetupPartFourDataReadingState
    extends State<InitialSetupPartFourDataReading> {
  List<String> act = [];
  List<String> det = [];
  double count = 0;
  int length = 0;

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
    // getList();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('customerdata')
          .doc(uid)
          .collection('Guido$uid')
          .doc('guidoAdOne')
          .collection('whatsIncluded')
          .doc('items')
          .snapshots(),
      builder: ((context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return InitialSetupPageFour(
            item: act,
            detail: det,
            length: 0,
          );
        } else if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.active) {
          Map<String, dynamic> data =
              snapshot.data?.data() as Map<String, dynamic>;
          count = data.length / 2.round();
          length = count.toInt();
          for (int i = 0; i < count; i++) {
            act.add(data['name$i']);
          }
          for (int i = 0; i < count; i++) {
            det.add(data['detail$i']);
          }
          return InitialSetupPageFour(
            length: length,
            item: act,
            detail: det,
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

class InitialSetupPageFour extends StatefulWidget {
  final List<String> item;
  final List<String> detail;
  final int length;

  const InitialSetupPageFour({
    super.key,
    required this.item,
    required this.detail,
    required this.length,
  });

  @override
  State<InitialSetupPageFour> createState() => _InitialSetupPageFourState();
}

class _InitialSetupPageFourState extends State<InitialSetupPageFour> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  late String Uid = '';
  bool dataPresent = false;

  int items = 0;
  String detail = '';
  String count = '';
  int descrip = 0;
  bool isFirstTime = false;

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
            .collection('events')
            .doc('eventOne')
            .snapshots() !=
        null) {
      dataPresent = true;
    }
  }

  void storeLength() {
    setState(() {
      items = widget.length as int;
      descrip = widget.length as int;
    });
  }

  final maxLines = 5;
  @override
  void initState() {
    super.initState();
    storeLength();
    getUserID();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void addToList() {
    setState(() {
      widget.item.insert(items, count);
      items++;
      widget.detail.insert(descrip, detail);
      descrip++;
    });
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
                      for (int i = 0; i < items; i++) {
                        _firestore
                            .collection('customerdata')
                            .doc(Uid)
                            .collection('Guido$Uid')
                            .doc('guidoAdOne')
                            .collection('whatsIncluded')
                            .doc('items')
                            .update({
                          'name$i': widget.item[i],
                          'detail$i': widget.detail[i],
                        });
                      }
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              InitialSetupPageFiveDataReading()));
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
        physics: ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      },
                      child: const Text(
                        'Need Help?',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w300),
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Whats Included',
                      textScaleFactor: 1.4,
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Mention all your offerings in your own words and describe them briefly for your customers to get a better idea of your expertise.',
                      textScaleFactor: 0.8,
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    // const SizedBox(height: 20, child: ForWhatsIncluded()),
                    ListView.builder(
                        scrollDirection: Axis.vertical,
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: items,
                        itemBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.width / 3.2,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 8.0, right: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          widget.item[index],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w300),
                                          textScaleFactor: 1.1,
                                        ),
                                        GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                widget.item.removeAt(index);
                                                widget.detail.removeAt(index);
                                                items--;
                                                descrip--;
                                                _firestore
                                                    .collection('customerdata')
                                                    .doc(Uid)
                                                    .collection('Guido$Uid')
                                                    .doc('guidoAdOne')
                                                    .collection('whatsIncluded')
                                                    .doc('items')
                                                    .set({});
                                                for (int i = 0;
                                                    i < items;
                                                    i++) {
                                                  _firestore
                                                      .collection(
                                                          'customerdata')
                                                      .doc(Uid)
                                                      .collection('Guido$Uid')
                                                      .doc('guidoAdOne')
                                                      .collection(
                                                          'whatsIncluded')
                                                      .doc('items')
                                                      .update({
                                                    'name$i': widget.item[i],
                                                    'detail$i':
                                                        widget.detail[i],
                                                  });
                                                }
                                              });
                                            },
                                            child: const Icon(
                                              LineariconsFree.cross,
                                              size: 15,
                                            ))
                                      ],
                                    ),
                                  ),
                                  TextField(
                                    controller: TextEditingController(
                                        text: widget.detail[index]),
                                    cursorColor: Colors.transparent,
                                    cursorWidth: 1,
                                    decoration: const InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black26)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black45)),
                                      border: OutlineInputBorder(),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            count = '';
                            detail = '';
                          });
                          Dialogs.materialDialog(
                              msg:
                                  'e.g. - activities you will personally provide the customer',
                              msgAlign: TextAlign.center,
                              title: "Add Custom Activity",
                              color: Colors.white,
                              context: context,
                              actions: [
                                Column(
                                  children: [
                                    TextField(
                                      controller:
                                          TextEditingController(text: count),
                                      onChanged: (value) {
                                        count = value;
                                      },
                                      cursorColor: Colors.transparent,
                                      cursorWidth: 1,
                                      decoration: const InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black26)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black45)),
                                        border: OutlineInputBorder(),
                                        fillColor: Colors.white,
                                        filled: true,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextField(
                                      controller:
                                          TextEditingController(text: detail),
                                      onChanged: (value) {
                                        detail = value;
                                      },
                                      cursorColor: Colors.transparent,
                                      cursorWidth: 1,
                                      decoration: const InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black26)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black45)),
                                        border: OutlineInputBorder(),
                                        fillColor: Colors.white,
                                        filled: true,
                                      ),
                                    ),
                                    ElevatedButton(
                                      child: const Text('Add'),
                                      onPressed: () {
                                        addToList();
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pop();
                                      },
                                    ),
                                  ],
                                )
                              ]);
                        },
                        child: AbsorbPointer(
                            child: Row(
                          children: const [
                            Icon(
                              LineariconsFree.plus_circle_1,
                              size: 15,
                            ),
                            Text(
                              ' Add More',
                              style: TextStyle(
                                  decoration: TextDecoration.underline),
                            )
                          ],
                        ))),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
