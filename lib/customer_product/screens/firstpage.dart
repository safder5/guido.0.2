import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  String name = '';
  String age = '';
  String address = '';
  String contact = '';
  String sendermail = '';
  String Uid =
      ''; // if there is a phone number login then we have to use phone as unique identification ..

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    final user = await _auth.currentUser;
    User loggedinUser;
    try {
      if (user != null) {
        loggedinUser = user;
        sendermail = loggedinUser.email!;
        Uid = sendermail;
        print(loggedinUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  String imgURL = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () async {
                //created a image picker instance to use camera or gallery to upload image
                ImagePicker imagePicker = ImagePicker();
                XFile? file =
                    await imagePicker.pickImage(source: ImageSource.gallery);
                print('${file?.path}');

                if (file == null) return;
                //to create unique file name
                //import dart core
                String uniqueFileName =
                    DateTime.now().microsecondsSinceEpoch.toString();

                // get a refereance to storage root
                Reference refRoot = FirebaseStorage.instance.ref();
                Reference refDirImages = refRoot.child('Images');

                //create a reference to store the image uploaded
                Reference refImagetoUpload = refDirImages.child(uniqueFileName);

                // handling errors /successful captures
                try {
                  // store the file
                  await refImagetoUpload.putFile(File(file.path));
                  //success : get the download url
                  imgURL = await refImagetoUpload.getDownloadURL();
                } catch (error) {
                  //Some error occurred
                }
              },
              icon: Icon(Icons.camera_alt_outlined)),
          Text('fcuk '),
          ElevatedButton(
              onPressed: () {
                _auth.signOut();
                print('signed off');
                Navigator.pop(context);
              },
              child: Text('logout')),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'What do people call you?',
              labelText: 'Name *',
            ),
            onChanged: (value) => name = value,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: '',
              labelText: 'age *',
            ),
            onChanged: (value) => age = value,
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: '',
              labelText: 'Address *',
            ),
            onChanged: (value) => address = value,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: '',
              labelText: 'Contact no. *',
            ),
            onChanged: (value) => contact = value,
          ),
          // TextFormField(
          //   keyboardType: TextInputType.number,
          //   decoration: const InputDecoration(
          //     icon: Icon(Icons.person),
          //     hintText: '',
          //     labelText: 'Contact no. *',
          //   ),
          //   onChanged: (value) => contact = value,
          // ),
          // TextFormField(
          //   keyboardType: TextInputType.number,
          //   decoration: const InputDecoration(
          //     icon: Icon(Icons.person),
          //     hintText: '',
          //     labelText: 'Contact no. *',
          //   ),
          //   onChanged: (value) => contact = value,
          // ),
          ElevatedButton(
              onPressed: () {
                if (imgURL.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please Upload an image')));
                  return;
                }
                _firestore
                    .collection('customerdata')
                    .doc(Uid)
                    .collection('wishlist')
                    .doc('favorites')
                    .set({});
                _firestore.collection('customerdata').doc(Uid).set({
                  'name': name,
                  'age': age,
                  'adress': address,
                  'contact': contact,
                  'sender': sendermail,
                  'image': imgURL,
                  'guido': 'no'
                });
                Navigator.pushNamed(context, '/afterinfopage');
              },
              child: Text('submit')),
        ],
      )),
    );
  }
}
