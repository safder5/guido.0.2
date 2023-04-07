// import 'dart:html';

// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:guido/constants/colors.dart';



class SettingsTabs extends StatefulWidget {
  final Widget icon;
  final Text setting;
  final Widget next;
  const SettingsTabs(this.icon, this.setting,{super.key, required this.next,});

  @override
  State<SettingsTabs> createState() => _SettingsTabsState();
}

class _SettingsTabsState extends State<SettingsTabs> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
       Navigator.of(context, rootNavigator: true)
        .push(MaterialPageRoute(
        builder: (context) => widget.next));
      },
      child: AbsorbPointer(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children:[
                      widget.icon,
                      const SizedBox(
                      width: 5,
                       ),
                      widget.setting,
                      const Spacer(),
                      const Icon(Icons.arrow_forward_ios,size: 16,),
                      
                  // GestureDetector(
                  //   child: const Icon(Icons.arrow_forward_ios),
                  //   onTap: () {
                  //     Navigator.pushNamed(context, screen);
                  //   },
                  // )
                ],
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
