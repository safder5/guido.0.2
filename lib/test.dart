import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('notes');

class Database {
  static String? userUid;

  // ...

  static Future<void> addItem({
  required String title,
  required String description,
}) async {
  DocumentReference documentReferencer =
      _mainCollection.doc(userUid).collection('items').doc();

  Map<String, dynamic> data = <String, dynamic>{
    "title": title,
    "description": description,
  };

  await documentReferencer
      .set(data)
      .whenComplete(() => print("Notes item added to the database"))
      .catchError((e) => print(e));
}

static Stream<QuerySnapshot> readItems() {
  CollectionReference notesItemCollection =
      _mainCollection.doc(userUid).collection('items');

  return notesItemCollection.snapshots();
}

static Future<void> updateItem({
  required String title,
  required String description,
  required String docId,
}) async {
  DocumentReference documentReferencer =
      _mainCollection.doc(userUid).collection('items').doc(docId);

  Map<String, dynamic> data = <String, dynamic>{
    "title": title,
    "description": description,
  };

  await documentReferencer
      .update(data)
      .whenComplete(() => print("Note item updated in the database"))
      .catchError((e) => print(e));
}

static Future<void> deleteItem({
  required String docId,
}) async {
  DocumentReference documentReferencer =
      _mainCollection.doc(userUid).collection('items').doc(docId);

  await documentReferencer
      .delete()
      .whenComplete(() => print('Note item deleted from the database'))
      .catchError((e) => print(e));
}
}

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  void call(){
    
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}










// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:guido/client_product/screens/clientProfile.dart';
// import 'package:guido/client_product/screens/signuppage.dart';
// import 'package:guido/constants/colors.dart';
// import 'package:line_icons/line_icon.dart';
// import 'package:line_icons/line_icons.dart';
// import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

// import 'customer_product/navscreens/customerProfile.dart';
// import 'customer_product/navscreens/explore.dart';
// import 'customer_product/navscreens/inbox.dart';
// import 'customer_product/navscreens/wishlist.dart';

// class TestPage extends StatefulWidget {
//   const TestPage({super.key});

//   @override
//   State<TestPage> createState() => _TestPageState();
// }

// class _TestPageState extends State<TestPage> {
//   int _currentStep = 0;
//   continueStep() {
//     if (_currentStep < 2) {
//       setState(() {
//         _currentStep += 1;
//       });
//     }
//   }

//   cancelStep() {
//     if (_currentStep > 0) {
//       setState(() {
//         _currentStep -= 1;
//       });
//     }
//   }

//   tapStep(int value) {
//     setState(() {
//       _currentStep = value;
//     });
//   }

//   Widget controlsBuilder(context, details) {
//     return Row(
//       children: [
//         ElevatedButton(
//             onPressed: details.onStepContinue, child: const Text('Next')),
//         const SizedBox(
//           width: 10.0,
//         ),
//         OutlinedButton(
//             onPressed: details.onStepCancel, child: Text('Previous')),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Theme(
//       data: ThemeData(
//         canvasColor: yellow,
//         colorScheme: Theme.of(context).colorScheme.copyWith(
//               primary: orange,
//               background: Colors.red,
//               secondary: Colors.green,
//             ),
//       ),
//       child: Stepper(
//         type: StepperType.vertical,
//         currentStep: _currentStep,
//         onStepContinue: continueStep,
//         onStepCancel: cancelStep,
//         onStepTapped: tapStep,
//         controlsBuilder: controlsBuilder,
//         steps: [
//           Step(
//             title: Text('1'),
//             content: First(),
//             isActive: _currentStep >= 0,
//           ),
//           Step(
//             title: Text('2'),
//             content: Second(),
//             isActive: _currentStep >= 1,
//           ),
//           Step(
//             title: Text('3'),
//             content: Third(),
//             isActive: _currentStep >= 2,
//           ),
//         ],
//       ),
//     ));
//   }
// }

// class First extends StatefulWidget {
//   const First({super.key});

//   @override
//   State<First> createState() => _FirstState();
// }

// class _FirstState extends State<First> {
//   String first = '';
//   String last = '';
//   String age = '';

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TextFormField(
//           decoration: const InputDecoration(hintText: 'First Name'),
//           onChanged: (value) {
//             first = value;
//           },
//         ),
//         TextFormField(
//           decoration: const InputDecoration(hintText: 'Last Name',),
//           onChanged: (value) {
//             last = value;
//           },
//         ),
//         TextFormField(
//           keyboardType: TextInputType.number,
//           decoration: const InputDecoration(hintText: 'Age'),
//           onChanged: (value) {
//             age = value;
//           },
//         ),
//       ],
//     );
//   }
// }

// class Second extends StatelessWidget {
//   const Second({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text('hi'),
//         Text('hi'),
//         Text('hi'),
//         Text('hi'),
//         Text('hi'),
//       ],
//     );
//   }
// }

// class Third extends StatelessWidget {
//   const Third({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text('hi'),
//         Text('hi'),
//         Text('hi'),
//         Text('hi'),
//         Text('hi'),
//       ],
//     );
//   }
// }

// //     PersistentTabController _controller;

// // _controller = PersistentTabController(initialIndex: 0);

// //  List<Widget> _buildScreens() {
// //         return [
// //            ExplorePage(),
// //            WishlistPage(),
// //            InboxPage(),
// //            CustomerProfile(),

// //         ];
// //     }

// //      List<PersistentBottomNavBarItem> _navBarsItems() {
// //         return [
// //             PersistentBottomNavBarItem(
// //                 icon: ShaderMask(
// //               shaderCallback: ( bounds) {
// //                 return LinearGradient(
// //                  begin: Alignment.topLeft,
// //                  end: Alignment.bottomRight,
// //                   colors: <Color>[
// //                     yellow,
// //                     orange
// //                   ],
// //                   tileMode: TileMode.mirror,
// //                 ).createShader(bounds);
// //               },
// //               child: const Icon(LineIcons.search,color: Colors.white,),
// //             ),

// //                 title: ("Explore"),
// //                 activeColorPrimary: yellow,
// //                 activeColorSecondary: orange,
// //                 inactiveColorPrimary: CupertinoColors.systemGrey,
// //             ),
// //             PersistentBottomNavBarItem(
// //                 icon: ShaderMask(
// //               shaderCallback: ( bounds) {
// //                 return LinearGradient(
// //                  begin: Alignment.topLeft,
// //                  end: Alignment.bottomRight,
// //                   colors: <Color>[
// //                     yellow,
// //                     orange
// //                   ],
// //                   tileMode: TileMode.mirror,
// //                 ).createShader(bounds);
// //               },
// //               child: const Icon(LineIcons.heart,color: Colors.white,),
// //             ),
// //                 title: ("Wishlist"),
// //                 activeColorPrimary: CupertinoColors.systemYellow,
// //                 activeColorSecondary: orange,
// //                 inactiveColorPrimary: CupertinoColors.systemGrey,
// //             ),
// //             PersistentBottomNavBarItem(
// //                 icon: ShaderMask(
// //               shaderCallback: ( bounds) {
// //                 return LinearGradient(
// //                  begin: Alignment.topLeft,
// //                  end: Alignment.bottomRight,
// //                   colors: <Color>[
// //                     yellow,
// //                     orange
// //                   ],
// //                   tileMode: TileMode.mirror,
// //                 ).createShader(bounds);
// //               },
// //               child: const Icon(LineIcons.plus,color: Colors.white,),
// //             ),
// //                 title: ("Guido"),
// //                 activeColorPrimary: CupertinoColors.systemYellow,
// //                 activeColorSecondary: orange,
// //                 inactiveColorPrimary: CupertinoColors.systemGrey,
// //             ),
// //             PersistentBottomNavBarItem(
// //                 icon: ShaderMask(
// //               shaderCallback: ( bounds) {
// //                 return LinearGradient(
// //                  begin: Alignment.topLeft,
// //                  end: Alignment.bottomRight,
// //                   colors: <Color>[
// //                     yellow,
// //                     orange
// //                   ],
// //                   tileMode: TileMode.mirror,
// //                 ).createShader(bounds);
// //               },
// //               child: const Icon(LineIcons.box,color: Colors.white,),
// //             ),

// //                 title: ("Inbox"),
// //                 activeColorPrimary: CupertinoColors.systemYellow,
// //                 activeColorSecondary: orange,
// //                 inactiveColorPrimary: CupertinoColors.systemGrey,
// //             ),
// //             PersistentBottomNavBarItem(
// //                 icon: ShaderMask(
// //               shaderCallback: ( bounds) {
// //                 return LinearGradient(
// //                  begin: Alignment.topLeft,
// //                  end: Alignment.bottomRight,
// //                   colors: <Color>[
// //                     yellow,
// //                     orange
// //                   ],
// //                   tileMode: TileMode.mirror,
// //                 ).createShader(bounds);
// //               },
// //               child: const Icon(LineIcons.user,color: Colors.white,),
// //             ),
// //                 title: ("Profile"),
// //                 activeColorPrimary: CupertinoColors.systemYellow,
// //                 activeColorSecondary: orange,
// //                 inactiveColorPrimary: CupertinoColors.systemGrey,
// //             ),

//         ];
//     }
//     return PersistentTabView(
//         context,
//         controller: _controller,
//         screens: _buildScreens(),
//         items: _navBarsItems(),
//         confineInSafeArea: true,
//         backgroundColor: Colors.white, // Default is Colors.white.
//         handleAndroidBackButtonPress: true, // Default is true.
//         resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
//         stateManagement: true, // Default is true.
//         hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
//         decoration: NavBarDecoration(
//           borderRadius: BorderRadius.circular(10.0),
//           colorBehindNavBar: Colors.white,
//         ),
//         popAllScreensOnTapOfSelectedTab: true,
//         popActionScreens: PopActionScreensType.all,
//         itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
//           duration: Duration(milliseconds: 200),
//           curve: Curves.ease,
//         ),
//         screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
//           animateTabTransition: true,
//           curve: Curves.ease,
//           duration: Duration(milliseconds: 200),
//         ),
//         navBarStyle: NavBarStyle.style12, // Choose the nav bar style with this property.
//     );
