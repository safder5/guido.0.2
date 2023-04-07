import 'package:flutter/material.dart';

class SpaceCard extends StatefulWidget {

   final Widget icon;
  final Text setting;
  final Widget next;
  const SpaceCard({super.key, required this.icon, required this.setting, required this.next});

  @override
  State<SpaceCard> createState() => _SpaceCardState();
}

class _SpaceCardState extends State<SpaceCard> {
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
          padding: const EdgeInsets.only(left: 24,right: 24,),
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
              const Divider(height: 48,thickness: 1,)
            ],
          ),
        ),
      ),
    );
  }
}