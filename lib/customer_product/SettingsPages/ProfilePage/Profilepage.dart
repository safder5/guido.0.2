import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:guido/constants/colors.dart';
import 'package:guido/constants/icons.dart';
//home for personal information clall the document snapshots from firebase firestore
//picture info still to be done

class ProfileinformationPage extends StatefulWidget {
  final String id = '/profile_information_page';

  const ProfileinformationPage({super.key});

  @override
  State<ProfileinformationPage> createState() =>
      _ProfileinformationPageState();
}

class _ProfileinformationPageState extends State<ProfileinformationPage> {
  final user = FirebaseAuth.instance.currentUser;
  final _auth = FirebaseAuth.instance;

  late String currentID = '';

  List<String> docID = [];

  // Future getdocID() async {
  //   await FirebaseFirestore.instance
  //       .collection('customerdata')
  //       .get()
  //       .then((snapshot) => snapshot.docs.forEach((document) {
  //             print(document.reference);
  //             docID.add(document.reference.id);
  //           }));
  // }

  String getID() {
    currentID = _auth.currentUser!.email!;
    return currentID;
  }

  @override
  void initState() {
    // getdocID();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        body: Center(
            child: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('customerdata')
              .doc(getID())
              .snapshots(),
          builder: ((context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('errror');
            }

            if (snapshot.connectionState == ConnectionState.active) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;
              return ProfileIPage(
                  data['name'], data['about'], data['work'], data['adress'],data['language']);
            }

            // Text(
            //     data['age'],
            //     style: TextStyle(color: yellow),
            //   )
            return const Text('loading');
          }),
        )));
  }
}
// personal information page starts here

class ProfileIPage extends StatelessWidget {
  final String name;
  final String about;
  final String work;
  final String address;
  final String language;

  const ProfileIPage(this.name, this.about, this.work, this.address, this.language,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(backgroundColor: grey,elevation: 0,automaticallyImplyLeading: false,),
      backgroundColor: white,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(children: [
              Container(
                color: white,
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              Container(
                // child: Image(image: ),
                color: grey,
                height: MediaQuery.of(context).size.height * 0.16,
                width: double.infinity,
              ),
              Positioned(
                left: MediaQuery.of(context).size.width * 0.06,
                bottom: MediaQuery.of(context).size.width * 0.0,
                child: CircleAvatar(
                  backgroundColor: orange,
                  radius: MediaQuery.of(context).size.height * 0.04,
                ),
              )
            ]),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'Hey,I am $name',
                              style:
                                  const TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                          const IconShader(
                              icon: Icon(
                            Icons.security_outlined,
                            color: Colors.white,
                            size: 15,
                          )), // icon to be changed
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      EditProfileIpage(name, about, work, address)));
                        },
                        child: const Text(
                          'EDIT',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
                child: ListView(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 20, right: 10, left: 10),
              shrinkWrap: true,
              children: [
                ListTile(
                  title: const Padding(
                    padding: EdgeInsets.only(bottom: 12.0),
                    child: Text('About',
                        style: TextStyle(fontWeight: FontWeight.w500)),
                  ),
                  subtitle: Text(
                    about,
                    textScaleFactor: 0.8,
                  ),
                ),
                const Divider(
                  thickness: 1,
                  height: 5,
                  indent: 10,
                  endIndent: 10,
                ),
                ListTile(
                  title: const Padding(
                    padding: EdgeInsets.only(bottom: 12.0),
                    child: Text('Work',
                        style: TextStyle(fontWeight: FontWeight.w500)),
                  ),
                  subtitle: Text(
                    work,
                    textScaleFactor: 0.8,
                  ),
                ),
                const Divider(
                    thickness: 1, height: 5, indent: 10, endIndent: 10),
                ListTile(
                  title: const Padding(
                    padding: EdgeInsets.only(bottom: 12.0),
                    child: Text(
                      'Address',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  subtitle: Text(
                    address,
                    textScaleFactor: 0.8,
                  ),
                ),
                const Divider(
                    thickness: 1, height: 5, indent: 10, endIndent: 10),
                ListTile(
                  title: const Padding(
                    padding: EdgeInsets.only(bottom: 12.0),
                    child: Text(
                      'Language',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  subtitle: Text(
                    language,
                    textScaleFactor: 0.8,
                  ),
                ),
                const Divider(
                    thickness: 1, height: 5, indent: 10, endIndent: 10),
                // Column(
                //   children: [Text('about'), Text(about)],
                // )
              ],
            )),
            const Divider(
              thickness: 1,
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 20, left: 10, right: 10),
              child: Column(children: [
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text('$name\'s Verified IDs'),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          IconShader(
                              icon: Icon(
                            Icons.check_circle_outline,
                            color: Colors.white,
                            size: 15,
                          )),
                          Text(
                            'Aadhaar',
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          IconShader(
                              icon: Icon(
                            Icons.check_circle_outline,
                            color: Colors.white,
                            size: 15,
                          )),
                          Text('Phone Number'),
                        ],
                      ),
                      Row(
                        children: const [
                          IconShader(
                              icon: Icon(
                            Icons.check_circle_outline,
                            color: Colors.white,
                            size: 15,
                          )),
                          Text('E-mail'),
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
// StreamBuilder(
//             stream: FirebaseFirestore.instance
//                 .collection('customerdata')
//                 .doc('$user')
//                 .snapshots(),
//             builder: (context, snapshot) {
//               if (!snapshot.hasData) return const Text('Loading ....');
//               return const Text('');
//             },
//           ),
//         )

// Editing page starts here

class EditProfileIpage extends StatelessWidget {
  final String name;
  final String about;
  final String work;
  final String address;
  const EditProfileIpage(this.name, this.about, this.work, this.address, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: white,
      //   elevation: 0,
      //   leading: TextButton(child:Text('back',style: TextStyle(color: black),),onPressed: () {
      //      Navigator.pop(context);
      //   },),
      //   actions:[
      //     Row(
      //     children: [
      //       TextButton(
      //           onPressed: () {
      //            // save the new details
      //           },
      //           child: Text(
      //             'save',
      //             style: TextStyle(color: black),
      //           )),
      //     ],
      //   ),
      //   ]
      // ),
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: black,
                    ),
                  ),
                ),
                GestureDetector(
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('save'),
                  ),
                  onTap: () {},
                  // save the details as the new values given
                  //after asking confirmation
                  //also if values are changed ask for confirm to leave page
                )
              ],
            ),
            Stack(children: [
              CircleAvatar(
                radius: 80,
                backgroundColor: grey,
              ),
              //bg image to be set after
              // image uploading setup is done
              Positioned(
                  bottom: 10,
                  right: 10,
                  child: IconShader(
                      icon: Icon(
                    Icons.cameraswitch_outlined,
                    color: white,
                  )))
              // icons to be changed
            ]),
          ],
        ),
      ),
    );
  }
}
