import 'package:flutter/material.dart';
import 'package:guido/constants/colors.dart';

class HelpEmergencyPage extends StatefulWidget {
  final String id = '/help_emergency';
  const HelpEmergencyPage({super.key});

  @override
  State<HelpEmergencyPage> createState() => _HelpEmergencyPageState();
}

class _HelpEmergencyPageState extends State<HelpEmergencyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(children: [
        // GestureDetector(
        //       onTap: () {
        //         Navigator.pop(context);
        //       },
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.start,
        //         children: const [
        //           Padding(
        //             padding: EdgeInsets.only(left: 8.0),
        //             child: Icon(
        //               Icons.arrow_back,
        //               size: 15,
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.start,
        //       children: const [
        //         Padding(
        //           padding: EdgeInsets.only(left: 24.0, top: 24),
        //           child: Text(
        //             'Personal Information',
        //             style: TextStyle(fontWeight: FontWeight.w100, fontSize: 25),
        //           ),
        //         ),
        //       ],
        //     ),
      Container(
        height: MediaQuery.of(context).size.height*0.4,
        width: double.infinity,
        color: Colors.redAccent,
        child: Center(child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Emergency Request Sent!',
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),
              textScaleFactor: 2.4,),
              SizedBox(height: 20,),
              Text('Help will reachout to you soon.',
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),
              textScaleFactor: 1.2,),
            ],
          ),
        )
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            Text('What next?',style: TextStyle(fontWeight: FontWeight.w500),textScaleFactor: 1.2,),
            SizedBox(height: 24,),
            Text('steps for after wards there is issue to find that design of bulletin so ... LATER'),
             SizedBox(height: 24,),
            const Divider(height: 20,thickness: 1,),
             SizedBox(height: 24,),
             Text('Capture what is going on around you!',style: TextStyle(fontWeight: FontWeight.w500),),
             Row(
              children: [
                //give camera recording and pictures option or audio 
              ],
             )

          ],
        ),
      )
      
      ],),
    );
  }
}
