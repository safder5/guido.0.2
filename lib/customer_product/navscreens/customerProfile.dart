import 'dart:io';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:guido/app/login.dart';
import 'package:guido/app/opening.dart';
import 'package:guido/client_product/initial_pages_setup/clientpageone.dart';
import 'package:guido/client_product/initial_pages_setup/setuppageone.dart';
import 'package:guido/constants/colors.dart';
import 'package:guido/constants/icons.dart';
import 'package:guido/constants/settingtab.dart';
import 'package:guido/constants/container.dart';
import 'package:guido/constants/SettingTabNew.dart';
import 'package:guido/customer_product/SettingsPages/General/Personal_info_pages/personalinformation.dart';
import 'package:guido/customer_product/SettingsPages/Legal/PrivacyPolicy/privacypolicy.dart';
import 'package:guido/customer_product/SettingsPages/Legal/Terms&Conditions/termsandconditions.dart';
import 'package:guido/customer_product/SettingsPages/Notifications/notificationsetting.dart';
import 'package:guido/customer_product/SettingsPages/ProfilePage/Profilepage.dart';
import 'package:guido/customer_product/SettingsPages/Support/Call_Us/call_us.dart';
import 'package:guido/customer_product/SettingsPages/Support/Emergency/emergency.dart';
import 'package:guido/customer_product/SettingsPages/Support/Give_Us_Feedback/giveusfeedback.dart';
import 'package:guido/customer_product/SettingsPages/Support/How_Guido_Works/howguidoworks.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../SettingsPages/General/Accounts&Privacy/accounts_privacy.dart';
import '../SettingsPages/General/Change_Language/ChangeLanguage.dart';
import '../SettingsPages/General/Payment&cards/payment_and_cards.dart';

List<Color> colorizeColors = [orange, yellow,white];

class CustomerProfile extends StatefulWidget {
  const CustomerProfile({super.key});

  @override
  State<CustomerProfile> createState() => _CustomerProfileState();
}

class _CustomerProfileState extends State<CustomerProfile> {
  final _auth = FirebaseAuth.instance;
  final user = FirebaseAuth.instance.currentUser;
  late String currentID = '';

  @override
  void initState() {
    super.initState();
  }

  String getID() {
    currentID = _auth.currentUser!.email!;
    return currentID;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: Center(
          child: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('customerdata')
            .doc(getID())
            .snapshots(),
        builder: ((context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return Text('${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.active) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return CPPage(
              name: data['name'],
            );
          }

          // Text(
          //     data['age'],
          //     style: TextStyle(color: yellow),
          //   )
          return const Text('loading');
        }),
      )),
    );
  }
}

class CPPage extends StatefulWidget {
  final String name;
  const CPPage({super.key, required this.name});

  @override
  State<CPPage> createState() => _CPPageState();
}

class _CPPageState extends State<CPPage> {
  String imgURL = '';
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 16.0, left: 16),
            child: Text(
              'Profile',
              textScaleFactor: 1.6,
              style: TextStyle(fontWeight: FontWeight.w200),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 16.0, right: 16, bottom: 16, top: 8),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(
                        builder: (context) => const ProfileinformationPage()));
              },
              child: Container(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: grey.withOpacity(0.3),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.name,
                          textScaleFactor: 1.3,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'Show Profile',
                          textScaleFactor: 0.65,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Text(
                              'Complete your profile (2/6).  ',
                              textScaleFactor: 0.65,
                            ),
                            TextShader(Text(
                              'Edit',
                              style: TextStyle(color: white),
                              textScaleFactor: 0.65,
                            ))
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Stack(children: [
                          Container(
                            height: 6,
                            width: width / 2,
                            decoration: BoxDecoration(
                                color: black.withOpacity(0.05),
                                border: Border.all(color: trans),
                                borderRadius: BorderRadius.circular(6)),
                          ),
                          Container(
                            height: 6,
                            width: width / 5,
                            decoration: BoxDecoration(
                                gradient:
                                    LinearGradient(colors: [orange, yellow]),
                                color: white,
                                border: Border.all(color: trans),
                                borderRadius: BorderRadius.circular(6)),
                          )
                        ]),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    LineariconsFree.pencil,
                    size: 12,
                    color: black,
                  ),
                ]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context,rootNavigator: true).pushNamed('/create_initial_guido_data');
              },
              child: Container(
                  width: width,
                  height: width / 3.5,
                  decoration: BoxDecoration(
                    color: white,
                    border: GradientBoxBorder(
                      gradient: LinearGradient(colors: [orange, yellow]),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 8.0, top: 12, bottom: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Make ',
                                style: GoogleFonts.libreBaskerville(
                                    textStyle: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                )),
                                textScaleFactor: 1.2,
                              ),
                              TextShader(Text(
                                'Experience ',
                                style: GoogleFonts.libreBaskerville(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: white)),
                                textScaleFactor: 1.2,
                              )),
                              Text(
                                'Better ',
                                style: GoogleFonts.libreBaskerville(
                                    textStyle: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                )),
                                textScaleFactor: 1.2,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                              width: width / 2,
                              child: const Text(
                                'It’s simple to setup and start earning ',
                                style: TextStyle(fontWeight: FontWeight.w300),
                                textScaleFactor: 0.9,
                              )),
                          const Spacer(),
                          AnimatedTextKit(
                            animatedTexts: [
                              ColorizeAnimatedText(
                                'Let’s make it happen',
                                textStyle: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                ),
                                colors: colorizeColors,
                              ),
                            ],
                          ),
                          // TextShader(Text(
                          //   'Let’s make it happen',
                          //   style: TextStyle(
                          //       fontWeight: FontWeight.w300, color: white),
                          //   textScaleFactor: 0.8,
                          // )),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: SizedBox(
                        width: width / 1.8,
                        height: width / 1.8,
                        child: const ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          child: Image(
                            image: AssetImage('lib/images/profile9.png'),
                            // width: width,
                            // height: height * 0.81,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    )
                  ])),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const SettingTabProfilePage(
                        name: 'Personal Information',
                        widget: PersonalinformationPage()),
                    const Divider(),
                    const SettingTabProfilePage(
                        name: 'Choose language', widget: ChangeLanguagePage()),
                    const Divider(),
                    const SettingTabProfilePage(
                        name: 'Payments & Cards',
                        widget: PaymentandCardsPage()),
                    const Divider(),
                    const SettingTabProfilePage(
                        name: 'Accounts & Privacy',
                        widget: AccountsandPrivacyPage()),
                    const Divider(),
                    const SettingTabProfilePage(
                        name: 'How Guido works', widget: HowGuidoWorksPage()),
                    const Divider(),
                    const SettingTabProfilePage(
                        name: 'Give us feedback', widget: GiveUsFeedback()),
                    const Divider(),
                    const SettingTabProfilePage(
                        name: 'Terms and conditions',
                        widget: TermsAndConditionsPage()),
                    const Divider(),
                    const SettingTabProfilePage(
                        name: 'Privacy policy', widget: PrivacyPolicyPage()),
                    const Divider(),
                    GestureDetector(
                      onTap: () {
                        _auth.signOut();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OpeningAppPage()));
                      },
                      child: AbsorbPointer(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Logout',
                                style: profileSettingTab,
                                textScaleFactor: 1,
                              ),
                              Icon(
                                Entypo.right_open_big,
                                size: 16,
                                color: black.withOpacity(0.3),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:32.0,right: 32),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const CallUs()));
                        },
                        child: AbsorbPointer(
                          child: Container(
                            decoration: BoxDecoration(
                              border: GradientBoxBorder(
                                  gradient:
                                      LinearGradient(colors: [orange, yellow]),
                                  width: 0.7),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top:32.0,bottom: 32,left: 24,right: 24),
                              child: Row(
                                children: [
                                  IconShader(
                                      icon: Icon(
                                    Icons.headphones,
                                    color: white,
                                  )),
                                  TextShader(Text(
                                    '  Feel free to Ask. We are ready to help!',textScaleFactor: 0.9,
                                    style: GoogleFonts.inter(
                                        textStyle: TextStyle(
                                            color: white,
                                            fontWeight: FontWeight.w200)),
                                  ))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}// Padding(
                //   padding: const EdgeInsets.all(24.0),
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //       GestureDetector(
                //           onTap: () {},
                //           child: const Text(
                //             'Guido',
                //             style: TextStyle(
                //                 fontSize: 20, fontWeight: FontWeight.w300),
                //             textScaleFactor: 1.4,
                //           )),
                //       const Padding(
                //         padding: EdgeInsets.all(4.0),
                //         child: Text(
                //           'Version 0.1.1',
                //           style: TextStyle(fontSize: 8, color: Colors.grey),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),

// body: Column(
//   mainAxisAlignment: MainAxisAlignment.start,
//   crossAxisAlignment: CrossAxisAlignment.start,
//   children: [
//     const SizedBox(
//       height: 50,
//     ),
//     Padding(
//       padding: const EdgeInsets.only(left: 12, top: 20, bottom: 20),
//       child: Text(
//         'Profile',
//         style: TextStyle(
//             color: black, fontSize: 14, fontWeight: FontWeight.w600),
//       ),
//     ),
//     Padding(
//       padding: const EdgeInsets.only(left: 12.0, right: 8, bottom: 12),
//       child: Row(
//         children: [
//           CircleAvatar(
//             backgroundColor: grey.withOpacity(0.5),
//             radius: 25,
//           ),
//           const SizedBox(
//             width: 8,
//           ),
//           Text(
//             name,
//             style: const TextStyle(),
//           ),
//           const Spacer(),
//           GestureDetector(
//             child: const Icon(
//               Icons.arrow_forward_ios_outlined,
//               size: 16,
//             ),
//             onTap: () {
//               Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(builder: (context)=> ProfileinformationPage() ));
//               //go to edit and profile details
//             },
//           ),
//         ],
//       ),
//     ),
//     Expanded(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         shrinkWrap: true,
//         children: [
//           // const Padding(
//           //   padding: EdgeInsets.only(bottom: 8.0, left: 8.0),
//           //   child: Text(
//           //     'General',
//           //     style: TextStyle(fontSize: 20),
//           //   ),
//           // ),
//           const SettingsTabs(
//             IconShader(
//                 icon: Icon(
//               Icons.person_outline,
//               color: Colors.white,
//             )),
//             Text('Personal Information'),
//             next: PersonalinformationPage(),
//           ),
//           const SettingsTabs(
//             IconShader(
//                 icon: Icon(
//               Icons.credit_card_outlined,
//               color: Colors.white,
//             )),
//             Text('Payments and Cards '),
//             next: PaymentandCardsPage(),
//           ),
//           const SettingsTabs(
//             IconShader(
//                 icon: Icon(
//               Icons.language_sharp,
//               color: Colors.white,
//             )),
//             Text('Change Language '),
//             next: ChangeLanguagePage(),
//           ),
//           const SettingsTabs(
//             IconShader(
//                 icon: Icon(
//               Icons.lock_outline,
//               color: Colors.white,
//             )),
//             Text('Accounts and Privacy '),
//             next: AccountsandPrivacyPage(),
//           ),
//           // const Padding(
//           //   padding: EdgeInsets.all(8.0),
//           //   child: Text(
//           //     'Support',
//           //     style: TextStyle(fontSize: 20),
//           //   ),
//           // ),
//           const SettingsTabs(
//             IconShader(
//                 icon: Icon(
//               Icons.person_outline_outlined,
//               color: Colors.white,
//             )),
//             Text('How Guido works '),
//             next: HowGuidoWorksPage(),
//           ),
//           const SettingsTabs(
//             IconShader(
//                 icon: Icon(
//               Icons.headphones,
//               color: Colors.white,
//             )),
//             Text('Call Us'),
//             next: CallUs(),
//           ),
//           const SettingsTabs(
//             IconShader(
//                 icon: Icon(
//               Icons.inbox,
//               color: Colors.white,
//             )),
//             Text('Give Us Feedback  '),
//             next: GiveUsFeedback(),
//           ),
//           const SettingsTabs(
//             Icon(
//               Icons.sos,
//               color: Colors.red,
//             ),
//             Text('Emergency ', style: TextStyle(color: Colors.red)),
//             next: EmergancyPage(),
//           ),
//           // const Padding(
//           //   padding: EdgeInsets.all(8.0),
//           //   child: Text(
//           //     'Legal',
//           //     style: TextStyle(fontSize: 20),
//           //   ),
//           // ),
//           const SettingsTabs(
//             IconShader(
//                 icon: Icon(
//               Icons.document_scanner,
//               color: Colors.white,
//             )),
//             Text('Terms and Conditions'),
//             next: TermsAndConditionsPage(),
//           ),
//           const SettingsTabs(
//             IconShader(
//                 icon: Icon(
//               Icons.privacy_tip_outlined,
//               color: Colors.white,
//             )),
//             Text('Privacy Policy'),
//             next: PrivacyPolicyPage(),
//           ),
//           // const SettingTabZ(icon: Icon(Icons.person),
//           // setting: Text('Privacy Policy'), nextpage: PrivacyPolicyPage()),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         final user = _auth.signOut();
//                       });
//                       Navigator.of(context, rootNavigator: true)
//                           .pushReplacement(MaterialPageRoute(
//                               builder: (context) => OpeningAppPage()));
//                     },
//                     child: const Text(
//                       'Logout',
//                       style: TextStyle(fontSize: 20),
//                     )),
//                 const Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Text(
//                     'Version 0.1.1',
//                     style: TextStyle(fontSize: 8, color: Colors.grey),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     )
//   ],
// ),

//  Container(
//                     decoration: BoxDecoration(
//                         boxShadow: const [
//                           BoxShadow(
//                               color: Colors.grey,
//                               blurRadius: 0.4,
//                               spreadRadius: 0.0,
//                               offset: Offset(
//                                 0, // Move to right 7.0 horizontally
//                                 0.4, // Move to bottom 8.0 Vertically
//                               ))
//                         ],
//                         color: Colors.white,
//                         // border: Border.all(),
//                         borderRadius: BorderRadius.circular(10)),
                    
// child: Column(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(top: 12.0),
//                           child: Row(
//                             children: [
//                               Container(
//                                 width: 5,
//                                 height: 20,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.only(
//                                       topRight: Radius.circular(5),
//                                       bottomRight: Radius.circular(5)),
//                                   gradient: LinearGradient(
//                                       colors: [orange, yellow],
//                                       begin: Alignment.topCenter,
//                                       end: Alignment.bottomCenter),
//                                 ),
//                               ),
//                               const SizedBox(
//                                 width: 10,
//                               ),
//                               const Text(
//                                 'General',
//                                 textScaleFactor: 1.2,
//                                 style: TextStyle(fontWeight: FontWeight.w300),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SettingTabZ(
//                             icon: Icon(
//                               Icons.person_outline,
//                               size: 20,
//                             ),
//                             setting: Text(
//                               'Personal Information',
//                               textScaleFactor: 0.8,
//                               style: TextStyle(fontWeight: FontWeight.w400),
//                             ),
//                             nextpage: PersonalinformationPage()),
//                         const Divider(
//                           height: 2,
//                           thickness: 1,
//                           indent: 35,
//                         ),
//                         const SettingTabZ(
//                             icon: Icon(
//                               Icons.lock_outline,
//                               size: 20,
//                             ),
//                             setting: Text(
//                               'Accounts and Privacy ',
//                               textScaleFactor: 0.8,
//                               style: TextStyle(fontWeight: FontWeight.w400),
//                             ),
//                             nextpage: AccountsandPrivacyPage()),
//                       ],
//                     )),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 Container(
//                     decoration: BoxDecoration(
//                         boxShadow: const [
//                           BoxShadow(
//                               color: Colors.grey,
//                               blurRadius: 0.4,
//                               spreadRadius: 0.0,
//                               offset: Offset(
//                                 0, // Move to right 7.0 horizontally
//                                 0.4, // Move to bottom 8.0 Vertically
//                               ))
//                         ],
//                         color: Colors.white,
//                         // border: Border.all(),
//                         borderRadius: BorderRadius.circular(10)),
//                     child: Column(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(top: 12.0),
//                           child: Row(
//                             children: [
//                               Container(
//                                 width: 5,
//                                 height: 20,
//                                 decoration: BoxDecoration(
//                                   borderRadius: const BorderRadius.only(
//                                       topRight: Radius.circular(5),
//                                       bottomRight: Radius.circular(5)),
//                                   gradient: LinearGradient(
//                                       colors: [orange, yellow],
//                                       begin: Alignment.topCenter,
//                                       end: Alignment.bottomCenter),
//                                 ),
//                               ),
//                               const SizedBox(
//                                 width: 10,
//                               ),
//                               const Text(
//                                 'Support',
//                                 textScaleFactor: 1.2,
//                                 style: TextStyle(fontWeight: FontWeight.w300),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SettingTabZ(
//                             icon: Icon(
//                               Icons.person_outline_outlined,
//                               size: 20,
//                             ),
//                             setting: Text(
//                               'How Guido Works ',
//                               textScaleFactor: 0.8,
//                               style: TextStyle(fontWeight: FontWeight.w400),
//                             ),
//                             nextpage: HowGuidoWorksPage()),
//                         const Divider(
//                           height: 2,
//                           thickness: 1,
//                           indent: 35,
//                         ),
//                         const SettingTabZ(
//                             icon: Icon(
//                               Icons.headphones,
//                               size: 20,
//                             ),
//                             setting: Text(
//                               'Call Us',
//                               textScaleFactor: 0.8,
//                               style: TextStyle(fontWeight: FontWeight.w400),
//                             ),
//                             nextpage: CallUs()),
//                         const Divider(
//                           height: 2,
//                           thickness: 1,
//                           indent: 35,
//                         ),
//                         const SettingTabZ(
//                           icon: Icon(
//                             Icons.inbox,
//                             size: 20,
//                           ),
//                           setting: Text(
//                             'Give Us Feedback',
//                             textScaleFactor: 0.8,
//                             style: TextStyle(fontWeight: FontWeight.w400),
//                           ),
//                           nextpage: GiveUsFeedback(),
//                         ),
//                       ],
//                     )),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 Container(
//                     decoration: BoxDecoration(
//                         boxShadow: const [
//                           BoxShadow(
//                               color: Colors.grey,
//                               blurRadius: 1.0,
//                               spreadRadius: 0.0,
//                               offset: Offset(
//                                 0, // Move to right 7.0 horizontally
//                                 0.5, // Move to bottom 8.0 Vertically
//                               ))
//                         ],
//                         color: Colors.white,
//                         // border: Border.all(),
//                         borderRadius: BorderRadius.circular(10)),
//                     child: Column(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(top: 12.0),
//                           child: Row(
//                             children: [
//                               Container(
//                                 width: 5,
//                                 height: 20,
//                                 decoration: BoxDecoration(
//                                   borderRadius: const BorderRadius.only(
//                                       topRight: Radius.circular(5),
//                                       bottomRight: Radius.circular(5)),
//                                   gradient: LinearGradient(
//                                       colors: [orange, yellow],
//                                       begin: Alignment.topCenter,
//                                       end: Alignment.bottomCenter),
//                                 ),
//                               ),
//                               const SizedBox(
//                                 width: 10,
//                               ),
//                               const Text(
//                                 'More',
//                                 textScaleFactor: 1.2,
//                                 style: TextStyle(fontWeight: FontWeight.w300),
//                               ),
//                             ],
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               _auth.signOut();
//                             });
//                           },
//                           child: LogoutButton(
//                               icon: const Icon(
//                                 Icons.logout,
//                                 size: 20,
//                               ),
//                               setting: const Text(
//                                 'Logout',
//                                 textScaleFactor: 0.8,
//                                 style: TextStyle(fontWeight: FontWeight.w400),
//                               ),
//                               nextpage: OpeningAppPage()),
//                         ),
//                       ],
//                     )),