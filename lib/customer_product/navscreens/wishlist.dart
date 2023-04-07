import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:guido/constants/colors.dart';
import 'package:guido/feedpages/feedAd.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';

// class WishlistDataReader extends StatefulWidget {
//   const WishlistDataReader({super.key});

//   @override
//   State<WishlistDataReader> createState() => _WishlistDataReaderState();
// }

// class _WishlistDataReaderState extends State<WishlistDataReader> {
//   final _firebase = FirebaseFirestore.instance;
//   final _auth = FirebaseAuth.instance;

//   getUserID() async {
//     final user = _auth.currentUser;
//     try {
//       if (user != null) {
//         uid = user.email!;
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   late String uid = '';
//   @override
//   void initState() {
//     super.initState();
//     getUserID();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<DocumentSnapshot>(
//       stream: FirebaseFirestore.instance
//           .collection('customerdata')
//           .doc(uid)
//           .collection('wishlist')
//           .doc('favorites')
//           .snapshots(),
//       builder: ((context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return WishlistPage();
//         } else if (snapshot.hasData &&
//             snapshot.connectionState == ConnectionState.active) {
//           Map<String, dynamic> data =
//               snapshot.data?.data() as Map<String, dynamic>;
//           // int count = data.length;
//           // count = data.length / 2.round();
//           // length = count.toInt();
//           // for (int i = 0; i < count; i++) {
//           //   act.add(data['name$i']);
//           // }
//           // for (int i = 0; i < count; i++) {
//           //   det.add(data['detail$i']);
//           // }
//           return WishlistPage();
//         }
//         return Scaffold(
//           backgroundColor: white,
//           body: Center(
//             child: Text('Loading'),
//           ),
//         );
//       }),
//     );
//   }
// }

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  final _firebase = FirebaseFirestore.instance;
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

  String name = '';
  int count = 0;
  TextEditingController wishlistName = TextEditingController();
  late String uid = '';
  @override
  void initState() {
    super.initState();
    getUserID();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Wishlists',
                  textScaleFactor: 1.6,
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
                GestureDetector(
                    onTap: () {
                      Dialogs.materialDialog(
                          msg: 'Write name for your Wishlist',
                          msgStyle: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w300),
                          msgAlign: TextAlign.center,
                          // title: "Write name for your Wishlist",
                          titleStyle: const TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 18),
                          color: Colors.white,
                          context: context,
                          actions: [
                            Column(
                              children: [
                                TextField(
                                  controller: TextEditingController(
                                      text: wishlistName.text),
                                  onChanged: (value) {
                                    name = value;
                                    // count = value;
                                  },
                                  cursorColor: Colors.transparent,
                                  cursorWidth: 1,
                                  maxLength: 30,
                                  decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ElevatedButton(
                                  child: const Text('Add'),
                                  onPressed: () {
                                    print(name);
                                    // _firebase
                                    //     .collection('customerdata')
                                    //     .doc(uid)
                                    //     .collection('wishlist')
                                    //     .doc(name)
                                    //     .set({'name': name});
                                    // addToList();
                                    Navigator.of(context, rootNavigator: true)
                                        .pop();
                                  },
                                ),
                              ],
                            )
                          ]);
                      // creating name for wishlist
                    },
                    child: Icon(
                      Icons.add,
                      color: black.withOpacity(0.7),
                      size: 24,
                    )),
              ],
            ),
            const ParticularWishlist(nameofWL: 'Favorites')
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.7,
            //   child: StreamBuilder(
            //       stream: FirebaseFirestore.instance
            //           .collection('customerdata')
            //           .doc(uid)
            //           .collection('wishlist')
            //           .snapshots(),
            //       builder: (context,
            //           AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
            //               snapshot) {
            //         if (snapshot.connectionState == ConnectionState.waiting) {
            //           return const Center(
            //             child: CircularProgressIndicator(
            //               color: Colors.black,
            //             ),
            //           );
            //         }
            //         List<dynamic> data = snapshot.data!.docs;
            //         count = snapshot.data!.docs.length;
            //         return SizedBox(
            //           child: ListView.builder(
            //             itemCount: count,
            //             itemBuilder: (context, index) {
            //               return ParticularWishlist(
            //                 nameofWL: data[index]['name'] ?? 'favorites',
            //               );
            //             },
            //           ),
            //         );
            //       }),
            // ),
          ],
        ),
      )),
    );
  }
}

class ParticularWishlist extends StatefulWidget {
  final String nameofWL;
  const ParticularWishlist({super.key, required this.nameofWL});

  @override
  State<ParticularWishlist> createState() => _ParticularWishlistState();
}

class _ParticularWishlistState extends State<ParticularWishlist> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OpenParticularWishlistPage(
                        name: widget.nameofWL,
                      )));
        },
        child: AbsorbPointer(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.nameofWL,
                    textScaleFactor: 1.4,
                    style: const TextStyle(fontWeight: FontWeight.w300),
                  ),
                  const Icon(
                    LineariconsFree.upload,
                    size: 18,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OpenParticularWishlist extends StatefulWidget {
  final String nameofWL;
  const OpenParticularWishlist({super.key, required this.nameofWL});

  @override
  State<OpenParticularWishlist> createState() => _OpenParticularWishlistState();
}

class _OpenParticularWishlistState extends State<OpenParticularWishlist> {
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

  late String uid = '';
  @override
  void initState() {
    super.initState();
    getUserID();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(widget.nameofWL),
            const SizedBox(
              height: 20,
            ),
            StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('customerdata')
                  .doc(uid)
                  .collection('wishlist')
                  .doc(widget.nameofWL)
                  .snapshots(),
              builder: ((context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text('wait error here');
                } else if (snapshot.hasData &&
                    snapshot.connectionState == ConnectionState.active) {
                  Map<String, dynamic> data =
                      snapshot.data?.data() as Map<String, dynamic>;
                  print(data);
                  int count = data.length;
                  return SizedBox(
                    child: ListView.builder(
                      itemCount: count,
                      itemBuilder: (context, index) {
                        return AdWithData(uid: data[uid + '${index}']);
                      },
                    ),
                  );
                }
                return Scaffold(
                  backgroundColor: white,
                  body: const Center(
                    child: Text('Loading'),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

List<String> uidsAdsWL =[
 'aryamann@gmail.com',
 'shz@g.com'
];
class OpenParticularWishlistPage extends StatefulWidget {
  final String name;
  const OpenParticularWishlistPage({super.key, required this.name});

  @override
  State<OpenParticularWishlistPage> createState() =>
      _OpenParticularWishlistPageState();
}

class _OpenParticularWishlistPageState
    extends State<OpenParticularWishlistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  LineariconsFree.arrow_left,
                  size: 20,
                  color: black.withOpacity(0.87),
                ),
                const SizedBox(
                  width: 18,
                ),
                Text(
                  widget.name,
                  style: const TextStyle(fontWeight: FontWeight.w300),
                  textScaleFactor: 1.4,
                ),
                const Spacer(),
                const Icon(
                  Icons.more_vert,
                  color: Colors.black54,
                  size: 21,
                )
              ],
            ),
            SizedBox(child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:32.0,left: 8,right: 8,bottom: 12),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.03),
                      borderRadius: BorderRadius.circular(6)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        children: [
                          const Icon(Icons.calendar_today_outlined,size: 12,color: Colors.black54,),
                          Text(' Dates',style: TextStyle(fontWeight: FontWeight.w300,color: black.withOpacity(0.7)),),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:32.0,left: 8,right: 8,bottom: 12),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.03),
                      borderRadius: BorderRadius.circular(6)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        children: [
                          const Icon(Icons.calendar_today_outlined,size: 12,color: Colors.black54,),
                          Text(' Guests',style: TextStyle(fontWeight: FontWeight.w300,color: black.withOpacity(0.7),))
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.7,
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context,index) {
                return AdWithData(uid: uidsAdsWL[index]);
              }),
            )
          ],
        ),
      )),
    );
  }
}
