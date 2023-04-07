import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guido/constants/buttons.dart';
import 'package:guido/constants/colors.dart';

class BankDetailsPage extends StatefulWidget {
  const BankDetailsPage({super.key});

  @override
  State<BankDetailsPage> createState() => _BankDetailsPageState();
}

class _BankDetailsPageState extends State<BankDetailsPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
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
              'Add your bank details',
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
                'Enter your accounts details so you will get your earning in your bank account directly',
                textScaleFactor: 0.8,
                style: TextStyle(fontWeight: FontWeight.w200),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              
              width: width*0.9,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Icon(LineariconsFree.picture_1,color: Color(0xFF7C7979),),
                    SizedBox(height: 5,),
                    Text('Add Passbook or Cheque Photo',textScaleFactor: 0.9,style: TextStyle(fontWeight: FontWeight.w200),)
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: black.withOpacity(0.05),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: trans)
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
                  labelText: 'Account Number ',
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
                  labelText: 'Confirm Accounts Number ',
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
                  labelText: 'Account Holder’s Name',
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
            Padding(
              padding: const EdgeInsets.only(top: 24.0, bottom: 24),
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
                  labelText: 'IFSC Code',
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
            Text('Please enter your correct bank details carefully.',textScaleFactor: 0.8,style: TextStyle(fontWeight: FontWeight.w300)),
            Text('They will be used for all your earning and bonus payments.',textScaleFactor: 0.8,style: TextStyle(fontWeight: FontWeight.w300)),            
            SizedBox(height: 20,),
            Row(
              children: [

              ],
            ),
            // SizedBox(height: 20,),
            MyElevatedButton(onPressed: (){}, 
            width: width*0.9,
            borderRadius: BorderRadius.circular(10),
            child: Text('Verify',style: TextStyle(fontWeight: FontWeight.w300),))
          ],
        ),
      ))),
    );
  }
}
