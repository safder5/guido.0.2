import 'package:flutter/material.dart';
import 'package:guido/constants/colors.dart';

class TalkToUsePage extends StatefulWidget {
  final String id = '/talk_to_us';
  const TalkToUsePage({super.key});

  @override
  State<TalkToUsePage> createState() => _TalkToUsePageState();
}

class _TalkToUsePageState extends State<TalkToUsePage> {
  String _dropdownvalue = 'English';
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  'Customer Call Support',
                  style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontSize: 25,
                      color: Colors.black),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: Text('Add your contact info and someone from'
                ' our costumer support team will call you as soon as possible.'),
          ),
          Padding(
            padding: const EdgeInsets.all(48.0),
            child: DropdownButtonFormField(items: const [
              DropdownMenuItem(
                value: 'English',
                child: Text('English',textScaleFactor: 0.8,),
              ),
              DropdownMenuItem(
                value: 'Hindi',
                child: Text('Hindi',textScaleFactor: 0.8,),
              ),
            ], value: _dropdownvalue,
             onChanged: Dropdowncallback,
             icon: const Icon(Icons.keyboard_arrow_down_outlined),
             isExpanded: true,
             decoration: const InputDecoration(
             border: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1
              ),
             ),
            ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(top:48.0,left: 48,right: 48),
          //   child: Column(
          //     children:const  [
          //       TextField(
          //         readOnly: true,
          //       onChanged: null,
          //        decoration:  InputDecoration(
          //        border: OutlineInputBorder(
          //         borderRadius: BorderRadius.only(topLeft: Radius.circular(5),topRight:  Radius.circular(5),),
          //         borderSide: BorderSide(
          //           width: 1
          //         ),
          //        ),
          //       ),
          //       ),
          //        TextField(
          //         keyboardType: TextInputType.phone,
          //         decoration:  InputDecoration(
          //         hintText: 'phone number',
          //         border: OutlineInputBorder(
          //           borderRadius: BorderRadius.only(bottomLeft:  Radius.circular(5),bottomRight:  Radius.circular(5),),
          //         borderSide: BorderSide(
          //           width: 1
          //     ),
          //    ), ),
          //   ),
          //     ],
          //   ),
          // ),
          Padding(padding: EdgeInsets.all(48),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black45
              ),
              borderRadius: BorderRadius.circular(5)
            ),
            child: Row(children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text('+91'),
              ),
              
            ]),
          ),),
          Padding(padding: EdgeInsets.only(left: 48),
          child: OutlinedButton(
            style: ButtonStyle(

            ),
            child: Text('Request Call'),onPressed: () {
            
          },),)
        ],
      )),
    );
  }
}
