import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:guido/bookkingProcess/dateselection.dart';
import 'package:guido/constants/icons.dart';
import 'package:guido/customer_product/Search/searchpage.dart';
import 'package:guido/feedpages/feedAd.dart';

import '../../constants/colors.dart';

bool equalsIgnoreCase(String string1, String string2) {
  return string1.toLowerCase() == string2.toLowerCase();
}

class SearchAdList extends StatefulWidget {
  final String result;
  const SearchAdList({super.key, required this.result});

  @override
  State<SearchAdList> createState() => _SearchAdListState();
}

class _SearchAdListState extends State<SearchAdList> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('guidoS').snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
            }
            List<dynamic> data = snapshot.data!.docs;
            count = snapshot.data!.docs.length;
            List<String> resultList = [];
            for (int i = 0; i < count; i++) {
              if (equalsIgnoreCase(data[i]['city'], widget.result)) {
                resultList.add(data[i]['name']);
              }
            }
            return Scaffold(
              backgroundColor: white,
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: black.withOpacity(
                                    0.15,
                                  ),
                                  width: 0.5),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () => Navigator.pop(context),
                                      child: AbsorbPointer(
                                        child: Padding(
                                            padding: EdgeInsets.all(2.0),
                                            child: IconShader(
                                              icon: Icon(
                                                Entypo.left_open_big,
                                                size: 18,
                                                color: white,
                                              ),
                                            )),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      widget.result,
                                      style:
                                          TextStyle(fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: black.withOpacity(
                                          0.15,
                                        ),
                                        width: 0.3),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              IntrinsicHeight(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> DateSelectionPage()));
                                  },
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Icon(LineariconsFree.calendar_full,
                                                size: 15,
                                                color: black.withOpacity(
                                                  0.5,
                                                )),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              'Dec 29 - Jan 6',
                                              textScaleFactor: 0.9,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w300),
                                            )
                                          ],
                                        ),
                                      ),
                                      Spacer(),
                                      VerticalDivider(
                                        thickness: 0.5,
                                        width: 0.5,
                                        color: black.withOpacity(0.15),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.people_outlined,
                                              color: black.withOpacity(
                                                0.5,
                                              ),
                                              size: 15,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              '2 guest',
                                              textScaleFactor: 0.9,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w300),
                                            )
                                          ],
                                        ),
                                      ),
                                      Spacer()
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      resultList.isEmpty
                          ? const Text(
                              'Sorry, No results found try changing the city')
                          : SizedBox(
                            width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.65,
                              child: ListView.builder(
                                itemCount: resultList.length,
                                itemBuilder: (context, index) {
                                  // if (equalsIgnoreCase(data[index]['city'], widget.result)) {
                                  //   return
                                  // }
                                  return AdWithData(uid: resultList[index]);
                                },
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class SearchResultsBuilder extends StatefulWidget {
  final String uid;
  const SearchResultsBuilder({super.key, required this.uid});

  @override
  State<SearchResultsBuilder> createState() => _SearchResultsBuilderState();
}

class _SearchResultsBuilderState extends State<SearchResultsBuilder> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(widget.uid),
    );
  }
}
