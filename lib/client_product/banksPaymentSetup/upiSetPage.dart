import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guido/constants/buttons.dart';
import 'package:guido/constants/icons.dart';

import '../../constants/colors.dart';

class UpiSetupPage extends StatefulWidget {
  const UpiSetupPage({super.key});

  @override
  State<UpiSetupPage> createState() => _UpiSetupPageState();
}

class _UpiSetupPageState extends State<UpiSetupPage> {
    bool value = false;
  @override
  Widget build(BuildContext context) {
   double width = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height*0.2,
        child: Column(
          children: [
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(top:16.0,left: 16,right: 16),
              child: Row(
                children: [
                  IconShader(icon: Icon(Icons.privacy_tip_outlined,size: 30,color: white,), ),
                  SizedBox(width: 5,),
                  Container(
                    width: width*0.8,
                    child: Text('Please enter the UPI details carefully and don’t worry, it is 100% safe',style: TextStyle(fontWeight: FontWeight.w300),)),
                ],
              ),
            ),
            SizedBox(height: 20,),
            MyElevatedButton(onPressed: (){}, 
            child: Text('Submit'),
            width: width*0.9,
            borderRadius: BorderRadius.circular(10),)
            
          ],
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Icon(
                        Icons.arrow_back,
                        color: Colors.black87,
                        size: 15,
                      ),
                    ],
                  ),
                ),
                OutlinedButton(
                    onPressed: () {
                      //takes to help page
                      //set this up later
                    },
                    child: const Text(
                      'Need Help?',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w300),
                    ))
              ],
            ),
            Text(
              'UPI Details',
              textScaleFactor: 1.4,
              style: GoogleFonts.inter(
                  textStyle: const TextStyle(fontWeight: FontWeight.w400)),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: width * 0.9,
              child: const Text(
                'Enter your UPI details so you will get your earning in your UPI directly',
                textScaleFactor: 0.8,
                style: TextStyle(fontWeight: FontWeight.w200),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0, bottom: 12),
              child: TextField(
                controller: TextEditingController(text: ''),
                onChanged: (value) {
                  // addressGovnDocs = value;
                },
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black26)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black45)),
                  labelText: 'UPI ID',
                  labelStyle: const TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.w300,
                      fontSize: 14),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                cursorColor: Colors.transparent,
                cursorWidth: 1,
              ),
            ),
            Text('Example: adhdXD@paytm',textScaleFactor: 0.8,style: TextStyle(fontWeight: FontWeight.w300),)
          ],
        ),
      ))),
    );
  }
}