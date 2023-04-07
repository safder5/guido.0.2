import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:guido/client_product/initial_pages_setup/insetpagefive.dart';
import 'package:guido/client_product/initial_pages_setup/insetpagefour.dart';
import 'package:guido/constants/colors.dart';
import 'package:cool_dropdown/cool_dropdown.dart';

import '../../constants/icons.dart';
import '../constants /button.dart';
import '../helpPages/needHelp.dart';

//need to make a skip button for this page
// if no then save accomodation as negative

class InitialSetupPageThree extends StatefulWidget {
  const InitialSetupPageThree({super.key});

  @override
  State<InitialSetupPageThree> createState() => _InitialSetupPageThreeState();
}

class _InitialSetupPageThreeState extends State<InitialSetupPageThree> {
  late SingleValueDropDownController _controller;
  @override
  void initState() {
    super.initState();
    _controller = SingleValueDropDownController();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.width * 0.28,
        width: double.infinity,
        child: Column(
          children: [
            const Divider(
              thickness: 1,
              height: 0,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      // Text('dates - , 2 guest',style: TextStyle(fontWeight: FontWeight.w300,color: Colors.black87),textScaleFactor: 0.8,),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '4/10 step',
                        style: TextStyle(
                            fontWeight: FontWeight.w300, color: Colors.black87),
                        textScaleFactor: 0.8,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // TextShader(Text('order Summary',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),textScaleFactor: 0.9,))
                    ],
                  ),
                  BorderGradientButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => InitialSetupPartFourDataReading()));
                    },
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.width * 0.15,
                    borderRadius: BorderRadius.circular(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        TextShader(Text(
                          'Next',
                          textScaleFactor: 1.2,
                          style: TextStyle(fontWeight: FontWeight.w300),
                        )),
                        IconShader(
                            icon: Icon(
                          Entypo.right_open_big,
                          size: 15,
                        ))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left:12.0,right: 12,top: 12),
              child: Row(
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
                          size: 15,
                        ),
                      ],
                    ),
                  ),
                  OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NeedHelpPage()));
                          
                        },
                        child: const Text(
                          'Need Help?',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w300),
                        ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                      'If you are willing to offer space in your home as the accommodation',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w300)),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    '\u2022 Explain what culture you made experience to costumer in brief way',
                    style: TextStyle(fontWeight: FontWeight.w300),
                    textScaleFactor: 0.9,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    '\u2022 Whatever language you offer you must be know it almost intermediate level',
                    style: TextStyle(fontWeight: FontWeight.w300),
                    textScaleFactor: 0.9,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: width,
                    height: width * 0.6,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: const Image(
                        image: AssetImage('lib/images/Sunpatio.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text('Are you willing to offer Space',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w300)),
                      const SizedBox(height: 15,),
                  //trying dropdowns different
                  DropDownTextField(
                    dropdownColor: white,
                    controller: _controller,
                    clearOption: true,
                    searchDecoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black45)),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        hintText: "Select"),
                    validator: (value) {
                      if (value == null) {
                        return "Required field";
                      } else {
                        return null;
                      }
                    },
                    dropDownItemCount: 2,
                    dropDownList: const [
                      DropDownValueModel(name: 'yes', value: "han"),
                      DropDownValueModel(name: 'no', value: "nahi"),
                    ],
                    onChanged: (val) {
                      //change the value
                    },
                  ),
                  // SizedBox(height: 100,),
              //  CoolDropdown(

              //    resultWidth: width,
              //    dropdownList: dropdownItemList,
              //    isResultLabel: true,
              //    onChange: (value) {
                   
              //    },
              //    dropdownItemReverse: false,
              //    dropdownItemMainAxis: MainAxisAlignment.start,
              //    resultMainAxis: MainAxisAlignment.start,
              //    dropdownWidth: width*0.8,
              //    dropdownHeight: width/3,
              //    labelIconGap: 20,
              //    resultIcon: Container(),

              //  ),
              const SizedBox(
                      height: 40,
                    ),
              const Text('How many people arrangement you have at once ', textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w300)),
                      const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Upload Experience part images',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      '\u2022 Try to upload high quality images',
                      style: TextStyle(fontWeight: FontWeight.w300),
                      textScaleFactor: 0.9,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '\u2022 Image must be 3200*2300 less than 5 MB',
                      style: TextStyle(fontWeight: FontWeight.w300),
                      textScaleFactor: 0.9,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DottedBorder(
                            // padding: const EdgeInsets.symmetric(
                            //     horizontal: 3, vertical: 24),
                            radius: const Radius.circular(10),
                            color: orange,
                            strokeWidth: 1,
                            borderType: BorderType.RRect,
                            dashPattern: const <double>[6, 6],
                            child: SizedBox(
                              width: width / 2.5,
                              height: width / 2.5,
                              // decoration: BoxDecoration(
                              //   borderRadius: BorderRadius.circular(10),
                              //   border: GradientBoxBorder(
                              //       gradient:
                              //           LinearGradient(colors: [orange, yellow])),
                              // ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child: IconShader(
                                          icon: Icon(
                                        LineariconsFree.upload,
                                        color: Colors.white,
                                        size: 30,
                                      )),
                                    ),
                                    BorderGradientButton(
                                        onPressed: () {},
                                        borderRadius: BorderRadius.circular(8),
                                        child: const TextShader(Text(
                                          'Browse',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300),
                                        ))),
                                    const Text(
                                      'Image must be PNG, JPEG',
                                      textScaleFactor: 0.8,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text('Uploaded Images : '),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      'Note : Describe all you offer in a clean way and mention everything you made the experience to customer , Whatever language you offer you must be know it almost intermediate level',
                      style: TextStyle(fontWeight: FontWeight.w300),
                      textScaleFactor: 0.8,
                    ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
