import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:guido/constants/box.dart';
import 'package:guido/constants/colors.dart';
import 'package:guido/constants/icons.dart';

//home for personal information clall the document snapshots from firebase firestore
//picture info still to be done

class PersonalinformationPage extends StatefulWidget {
  final String id = '/personal_information_page';

  const PersonalinformationPage({super.key});

  @override
  State<PersonalinformationPage> createState() =>
      _PersonalinformationPageState();
}

class _PersonalinformationPageState extends State<PersonalinformationPage> {
  final user = FirebaseAuth.instance.currentUser;
  final _auth = FirebaseAuth.instance;

  late String currentID = '';



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
              return PIPage(data['name'], data['about'], data['work'],
                  data['adress'], data['language'], data['sender'],data['contact']);
            }

            // Text(
            //     data['age'],
            //     style: TextStyle(color: yellow),
            //   )
            return const Text('loading');
          }),
        )
        )
        );
  }
}
// personal information page starts here

class PIPage extends StatelessWidget {
  final String name;
  final String about;
  final String work;
  final String address;
  final String language;
  final String email;
  final String contact;

  const PIPage(
      this.name, this.about, this.work, this.address, this.language, this.email,this.contact,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(backgroundColor: grey,elevation: 0,automaticallyImplyLeading: false,),
      backgroundColor: white,

      body: SafeArea(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Icon(
                      Icons.arrow_back,
                      size: 15,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 24.0, top: 24),
                  child: Text(
                    'Personal Information',
                    style: TextStyle(fontWeight: FontWeight.w100, fontSize: 25),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    left: 24,
                    top: 36,
                  ),
                  child: Text(
                    'Full Name',
                    style: TextStyle(fontWeight: FontWeight.w300,color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      hintText: name,
                      border: OutlineInputBorder(
                          gapPadding: 24, borderSide: BorderSide(color: black)),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 24, top: 24, bottom: 24),
                  child: Text(
                    'Gender',
                    style: TextStyle(fontWeight: FontWeight.w300,color: Colors.black),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Box('Male', active: false,),
                Box('Female', active: false,),
                Box('Other', active: false,),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 24, top: 24, bottom: 12),
                  child: Text(
                    'Email',
                    style: TextStyle(fontWeight: FontWeight.w300,color: Colors.black),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 24,
                      ),
                      child: Text(
                        email,
                        style: TextStyle(fontWeight: FontWeight.w300),
                        textScaleFactor: 0.9,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 24),
                      child: TextButton(
                          onPressed: () {},
                          child: Text('Update',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: black,
                                  decoration: TextDecoration.underline),
                              textScaleFactor: 0.9)),
                    )
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 24, top: 24, bottom: 12),
                  child: Text(
                    'Phone Number',
                    style: TextStyle(fontWeight: FontWeight.w300,color: Colors.black),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 24,
                      ),
                      child: Text(
                        contact,
                        style: TextStyle(fontWeight: FontWeight.w300),
                        textScaleFactor: 0.9,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 24),
                      child: TextButton(
                          onPressed: () {},
                          child: Text('Update',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: black,
                                  decoration: TextDecoration.underline),
                              textScaleFactor: 0.9)),
                    )
                  ],
                ),
              ],
            ),
            const Divider(height: 36,thickness: 1,indent: 24,endIndent: 24,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 24,
                          ),
                          child: Text(
                            'Emergency Contact',
                            style: TextStyle(fontWeight: FontWeight.w500,color: red),
                            textScaleFactor: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 24),
                          child: TextButton(
                              onPressed: () {},
                              child: Text('Add',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: black,
                                      decoration: TextDecoration.underline),
                                  textScaleFactor: 0.9)),
                        )
                      ],
                    ),
                   const Padding(
                  padding: EdgeInsets.only(left: 24, bottom: 12),
                  child: Text(
                    'not Provided ',
                    style: TextStyle(fontWeight: FontWeight.w300,color: Colors.black,),textScaleFactor: 0.9,
                    // emergency contact adding is to be done so wait for it
                    //  after that only this all will be added...
                  ),
                ),
              ],
            ),
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

class EditPIpage extends StatelessWidget {
  final String name;
  final String about;
  final String work;
  final String address;
   final String language;
  final String email;
  final String contact;
  const EditPIpage(this.name, this.about, this.work, this.address, {super.key,
   required this.language, required this.email, required this.contact});

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
