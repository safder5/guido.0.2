import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guido/constants/buttons.dart';
import 'package:guido/constants/colors.dart';
import '../constants/container.dart';

class VerifyPage extends StatefulWidget {
  final String id = '/verify_page';
  const VerifyPage({super.key});

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              'Verify your Identity',
              textScaleFactor: 1.5,
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Please verify your ID to complete the booking process this is only one time process, no need to verify next booking time.',
              textScaleFactor: 0.8,
              style: TextStyle(fontWeight: FontWeight.w200),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Government ID',
                      textScaleFactor: 1.1,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Passport',
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                        GestureDetector(
                            child: Icon(
                          LineariconsFree.chevron_down,
                          size: 15,
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Enter your passport no.', textScaleFactor: 1),
                    // SizedBox(height: 15,),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.transparent,
                      showCursor: true,
                      cursorWidth: 1,
                      decoration: const InputDecoration(
                        hintText: 'Enter Number',
                        hintStyle: TextStyle(),
                        contentPadding: EdgeInsets.all(0),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            gapPadding: 0),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            gapPadding: 0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
                child: MyElevatedButton(
              onPressed: () {},
              borderRadius: BorderRadius.circular(6),
              height: 40,
              child: const Text(
                '   OTP   ',
                textScaleFactor: 1.2,
              ),
            )),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text('OTP'),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: TextFormField(
                keyboardType: TextInputType.number,
                cursorColor: Colors.transparent,
                showCursor: true,
                cursorWidth: 1,
                decoration: const InputDecoration(
                  hintStyle: TextStyle(),
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black38),
                      gapPadding: 4),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black38),
                      gapPadding: 4),
                ),
              ),
            ),
            Row(
              children: [
                Checkbox(
                  checkColor: white,
                  focusColor: white,
                  hoverColor: white,
                  activeColor: orange,
                  splashRadius: 0,
                  value: value,
                  onChanged: (value) {
                    setState(() {
                      this.value = value!;
                    });
                  },
                ),
                const Flexible(
                  child: Text(
                    'I hereby accept that “I am giving my information to guido"',
                    style: TextStyle(fontWeight: FontWeight.w300),
                    textScaleFactor: 0.8,
                  ),
                ),
              ],
            ),
            Text(
              'By Clicking “Verify & Book”, you accept the T&Cs of the Guido Assist and the T&Cs of GUIDO. You can find more information on how we process your data in Our Privacy Policy. ',
              style: TextStyle(fontWeight: FontWeight.w300),
              textScaleFactor: 0.8,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyElevatedButton(
                width: double.infinity,
                onPressed: () {},
                child: Text(
                  'Verify & Book',
                  style: TextStyle(),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            paywalaContainer(
                primarytext: 'Secure data Transmission',
                secondarytext:
                    'Safe and encrypted transfer of your payments data.',
                icon: Icon(
                  LineariconsFree.lock_1,
                  color: Colors.white,
                  size: 20,
                )),
            paywalaContainer(
                primarytext: 'Secure Money Transactions',
                secondarytext: 'Safe and freely transfer of your money',
                icon: Icon(
                  FontAwesome5.credit_card,
                  color: Colors.white,
                  size: 20,
                )),
            SizedBox(
              height: 20,
            ),
            Text('Why need goverment ID'),
            SizedBox(
              height: 15,
            ),
            Text(
              'We only use your data to process inquiries to inform you about our own product. You can object to the use of your e-eamil address for sending product recommendations at any time without incuring any costs other than  the transmisson......',
              textScaleFactor: 0.8,
              style: TextStyle(fontWeight: FontWeight.w300),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 20,
            ),
            const Divider(
              thickness: 1,
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 200,
              child: Center(
                  child: Text(
                'GUIDO',
                style: GoogleFonts.inter(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w800, color: Colors.black12)),
                textScaleFactor: 2.5,
              )),
            )
          ]),
        ),
      )),
    );
  }
}
