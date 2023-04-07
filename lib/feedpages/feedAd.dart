import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guido/constants/colors.dart';
import 'package:guido/constants/container.dart';
import 'package:guido/customer_product/Search/searchcitiesBar.dart';
import 'package:guido/customer_product/navscreens/wishlist.dart';

import '../constants/addpage.dart';

class FeedAdList extends StatefulWidget {
  const FeedAdList({super.key});

  @override
  State<FeedAdList> createState() => _FeedAdListState();
}

class _FeedAdListState extends State<FeedAdList> {
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
            return SizedBox(
              child: ListView.builder(
                itemCount: count,
                itemBuilder: (context, index) {
                  // Future<String> getData() async {
                  //   final DocumentReference docref = FirebaseFirestore.instance
                  //       .collection('customerdata')
                  //       .doc(data[index]['name'])
                  //       .collection('Guido${data[index]['name']}')
                  //       .doc('guidoAdOne');
                  //   // docref.get().then((value) => 'pricebyGuido');
                  //   await docref
                  //       .get()
                  //       .then<dynamic>((DocumentSnapshot snap) async {
                  //     setState(() {
                  //       data = snap.data as List;
                  //     });
                  //   });
                  //   return  data['pricebyGuido'];
                  // }
                  return AdWithData(uid: data[index]['name']);
                },
              ),
            );
          }),
    );
  }
}

class AdWithData extends StatefulWidget {
  final String uid;
  const AdWithData({super.key, required this.uid});

  @override
  State<AdWithData> createState() => _AdWithDataState();
}

String price = '';
String title = '';
String uid = '';
String address = '';
String city = '';
String days = '';
String languages = '';
String guests = '';
String descriptionMap = '';
String descriptiontwo = '';

class _AdWithDataState extends State<AdWithData> {
  final _auth = FirebaseAuth.instance;
  String userid = '';
  List<String> likes = [];
  bool onetime = false;

  getUserID() async {
    final user = _auth.currentUser;
    try {
      if (user != null) {
        userid = user.email!;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> likeAd(List likes) async {
    getUserID();

    try {
      if (likes.contains(userid)) {
        await FirebaseFirestore.instance
            .collection('customerdata')
            .doc(widget.uid)
            .collection('Guido${widget.uid}')
            .doc('favorites')
            .update({
          'userIds': FieldValue.arrayRemove([userid])
        });
      } else {
        await FirebaseFirestore.instance
            .collection('customerdata')
            .doc(widget.uid)
            .collection('Guido${widget.uid}')
            .doc('favorites')
            .update({
          'userIds': FieldValue.arrayUnion([userid])
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  getLikesList() {
    StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('customerdata')
            .doc(widget.uid)
            .collection('Guido${widget.uid}')
            .doc('favorites')
            .snapshots(),
        builder: ((context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('error');
          } else if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.active) {
            Map<String, dynamic> data =
                snapshot.data?.data() as Map<String, dynamic>;
            likes = data['userIds'];
            return Text('done');
          }
          return Text('wait');
        }));
    return likes;
  }

  @override
  void initState() {
    super.initState();
    getUserID();
  }

  @override
  Widget build(BuildContext context) {
    return widget.uid == 'no result'
        ? const Center(
            child: Text(''),
          )
        : StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('customerdata')
                .doc(widget.uid)
                .collection('Guido${widget.uid}')
                .doc('guidoAdOne')
                .snapshots(),
            builder: ((context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError) {
                //             }
                // Map<String , dynamic> datatwo= snapshot.data?.data() as Map<String , dynamic>;
                return Text('error');
              } else if (snapshot.hasData &&
                  snapshot.connectionState == ConnectionState.active) {
                Map<String, dynamic> data =
                    snapshot.data?.data() as Map<String, dynamic>;
                price = data['pricebyGuido'];
                title = data['title'];
                uid = widget.uid;
                address = data['address'];
                city = data['city'];
                days = data['days'];
                languages = data['languages'];
                guests = data['maxguests'];
                descriptionMap = data['description'];
                descriptiontwo = data['descriptiontwo'];
                // pricebyGuidoforAD= data['pricebyGuido'] as? int?? 0  ;
                // print();
                return Stack(children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).push(
                          MaterialPageRoute(
                              builder: (context) => AddPage(
                                  uid: uid,
                                  title: title,
                                  address: address,
                                  city: city,
                                  days: days,
                                  languages: languages,
                                  guests: guests,
                                  price: price,
                                  descriptionMap: descriptionMap,
                                  descriptiontwo: descriptiontwo)));
                    },
                    child: ContainerWider(
                        Text(
                          'From \u{20B9}$price / person',
                          style: TextStyle(fontWeight: FontWeight.w500),
                          textScaleFactor: 0.8,
                        ),
                        Text(
                          '$title',
                          style: GoogleFonts.libreBaskerville(
                              textStyle: const TextStyle()),
                          textScaleFactor: 0.8,
                        ),
                        "lib/images/pic.png"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: GestureDetector(
                        onTap: () async {
                          await likeAd(getLikesList());
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => SearchLoader()));
                        },
                        child: Icon(
                          Icons.circle,
                          color: white,
                        )),
                  )
                ]);
              }
              return Text('Loading');
            }),
          );
  }
}


// ContainerWider(
//                       const Text(
//                         'From \$25 / person',
//                         style: TextStyle(fontWeight: FontWeight.w500),
//                         textScaleFactor: 0.5,
//                       ),
//                       Text(
//                         'A trail to the Himalayas unseen beauty',
//                         style: GoogleFonts.libreBaskerville(
//                             textStyle: const TextStyle()),
//                         textScaleFactor: 0.8,
//                       ),
//                       const Text(
//                         'specail Veiw points at sunrise',
//                         textScaleFactor: 0.6,
//                       ),
//                       "lib/images/pic.png");