import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:guido/constants/buttons.dart';
import 'package:guido/constants/colors.dart';
import 'package:guido/customer_product/SettingsPages/Support/Call_Us/talktous.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/icons.dart';
import '../constants /button.dart';

final Uri _url = Uri.parse('https://www.youtube.com/watch?v=orlUDdeoxZQ');

class NeedHelpPage extends StatefulWidget {
  const NeedHelpPage({super.key});

  @override
  State<NeedHelpPage> createState() => _NeedHelpPageState();
}

Icon plus = Icon(Octicons.plus_small);
Icon minimize = Icon(Entypo.minus,size: 20,);
bool one = false;
bool two = false;
bool three = false;

class _NeedHelpPageState extends State<NeedHelpPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.12,
        child: Column(
          children: [
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: MyElevatedButton(
                  onPressed: () {},
                  height: 40,
                  width: width * 0.9,
                  borderRadius: BorderRadius.circular(10),
                  child: Text('Continue for Answers')),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            Padding(
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
                      // OutlinedButton(
                      //     onPressed: () {
                      //       //takes to help page
                      //       //set this up later
                      //     },
                      //     child: const Text(
                      //       'Need Help?',
                      //       style: TextStyle(
                      //           color: Colors.black, fontWeight: FontWeight.w300),
                      //     ))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: width / 2,
                            child: Text(
                              'Hey, I am here to help you ',
                              textScaleFactor: 2,
                              style: TextStyle(fontWeight: FontWeight.w300),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Here we have video tutorial for you ',
                            style: TextStyle(fontWeight: FontWeight.w300)),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: _launchUrl,
                          child: SizedBox(
                            width: width,
                            child: AspectRatio(
                              aspectRatio: 180 / 100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: const Image(
                                  image: NetworkImage(
                                      'https://img.youtube.com/vi/orlUDdeoxZQ/0.jpg'), //fourthpagepic
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text('Still Need help? ',
                            style: TextStyle(fontWeight: FontWeight.w300)),
                        const SizedBox(
                          height: 20,
                        ),
                        BorderGradientButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => TalkToUsePage()));
                          },
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.width * 0.12,
                          borderRadius: BorderRadius.circular(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              TextShader(Text(
                                'Talk to Us',
                                textScaleFactor: 1,
                                style: TextStyle(fontWeight: FontWeight.w300),
                              )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: width,
              height: width * 0.85,
              decoration: BoxDecoration(color: black.withOpacity(0.05)),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'You’ve got questions ?',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'We’ve got answers!',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('How I get payments?'),
                        GestureDetector(
                          child: one ? minimize : plus,
                          onTap: () {
                            setState(() {
                              one = !one;
                            });
                            
                          },
                        )
                      ],
                    ),
                    SizedBox(height: 10,),
                    Visibility(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom:8.0),
                        child: Text(
                            "Get one on one guidance with expert and lot more to discribe here , need good contant writer job",textScaleFactor: 0.9,style: TextStyle(fontWeight: FontWeight.w300)),
                      ),
                      visible: one,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: width*0.8,
                          child: Text('Expert help you to make your add more attractive?')),
                        GestureDetector(
                          child: two ? minimize : plus,
                          onTap: () {
                            setState(() {
                              two = !two;
                            });
                            
                          },
                        )
                      ],
                    ),
                    SizedBox(height: 10,),
                    Visibility(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom:8.0),
                        child: Text(
                            "Get one on one guidance with expert and lot more to discribe here , need good contant writer job",textScaleFactor: 0.9,style: TextStyle(fontWeight: FontWeight.w300),),
                      ),
                      visible: two,
                    ),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('One-to-one guidance from a expert?'),
                        GestureDetector(
                          child: three ? minimize : plus,
                          onTap: () {
                            setState(() {
                              three = !three;
                            });
                            
                          },
                        )
                      ],
                    ),
                    SizedBox(height: 10,),
                    Visibility(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom:8.0),
                        child: Text(
                            "Get one on one guidance with expert and lot more to discribe here , need good contant writer job",textScaleFactor: 0.9,style: TextStyle(fontWeight: FontWeight.w300)),
                      ),
                      visible: three,
                    ),
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}
