import 'package:flutter/material.dart';
import 'package:guido/constants/colors.dart';
import 'package:guido/customer_product/SettingsPages/Support/Call_Us/call_us.dart';
import 'package:guido/customer_product/SettingsPages/Support/Call_Us/talktous.dart';

class GiveUsFeedback extends StatefulWidget {
  final String id = '/give_us_feedback';
  const GiveUsFeedback({super.key});

  @override
  State<GiveUsFeedback> createState() => _GiveUsFeedbackState();
}

class _GiveUsFeedbackState extends State<GiveUsFeedback> {
  String _dropdownvalue = 'Choose';
  final maxLines = 5;
  void Dropdowncallback(String? selectedvalue) {
    if (selectedvalue is String) {
      setState(() {
        _dropdownvalue = selectedvalue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
          child: SingleChildScrollView(
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
                  padding: EdgeInsets.only(left: 48.0, top: 48),
                  child: Text(
                    'Share your Feedback ',
                    style: TextStyle(fontWeight: FontWeight.w100, fontSize: 25),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(48.0),
              child: Column(
                children: const [
                  Text(
                    'We love to hear what you think about guido,'
                    ' we strongly change things for better ,please share your ideas,'
                    'appreciation or issues. It will take time to answer individually'
                    'but we reply every feedback.',
                    textScaleFactor: 0.9,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text('What topic or feature '),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 48.0, right: 48),
              child: DropdownButtonFormField(
                items: const [
                  DropdownMenuItem(
                    value: 'Choose',
                    child: Text(
                      'Choose',
                      textScaleFactor: 0.8,
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'X',
                    child: Text(
                      'X',
                      textScaleFactor: 0.8,
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'Y',
                    child: Text(
                      'Y',
                      textScaleFactor: 0.8,
                    ),
                  ),
                ],
                value: _dropdownvalue,
                onChanged: Dropdowncallback,
                icon: const Icon(Icons.keyboard_arrow_down_outlined),
                isExpanded: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Love to hear more'),
                  const SizedBox(height: 15),
                  Container(
                    height: maxLines * 24.0,
                    child: TextField(
                      maxLines: maxLines,
                      decoration:const InputDecoration(
                        border: OutlineInputBorder(),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  OutlinedButton(onPressed: () {}, child: Text('Submit'))
                ],
              ),
            ),
            const Divider(
              height: 10,
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Need to get in touch?',
                    textScaleFactor: 1.1,
                  ),
                  const Text(
                      'If you have any concern or don’t understand what to do, so feel free to call us'),
                  const SizedBox(
                    height: 10,
                  ),
                  OutlinedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => TalkToUsePage()));
                      },
                      child: const Text('Call Us'))
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
