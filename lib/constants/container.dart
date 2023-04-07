import "package:flutter/material.dart";
import 'package:fluttericon/entypo_icons.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:guido/constants/addpage.dart';
import 'package:guido/constants/icons.dart';

import 'colors.dart';

class YetAnotherContainer extends StatefulWidget {
  final Widget icon;
  final Widget next;
  final Text page;
  const YetAnotherContainer(this.icon, this.next, this.page, {super.key});

  @override
  State<YetAnotherContainer> createState() => _YetAnotherContainerState();
}

class _YetAnotherContainerState extends State<YetAnotherContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context, rootNavigator: true)
            .push(MaterialPageRoute(builder: (context) => widget.next));
      },
      child: AbsorbPointer(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.25,
            decoration: BoxDecoration(
                boxShadow: const [
                  // BoxShadow(
                  //     color: Colors.grey,
                  //     blurRadius: 0.0,
                  //     spreadRadius: 0.0,
                  //     offset: Offset(
                  //       0, // Move to right 7.0 horizontally
                  //       0.0, // Move to bottom 8.0 Vertically
                  //     ))
                ],
                color: Colors.white,
                // border: Border.all(),
                borderRadius: BorderRadius.circular(10)),
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  widget.icon,
                  const SizedBox(
                    height: 5,
                  ),
                  widget.page,
                ],
              ),
            )),
          ),
        ),
      ),
    );
  }
}

class AnotherContainer extends StatefulWidget {
  final Color color;
  const AnotherContainer(this.color, {super.key});

  @override
  State<AnotherContainer> createState() => _AnotherContainerState();
}

class _AnotherContainerState extends State<AnotherContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.22,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class ContainerWider extends StatefulWidget {
  final Widget text0;
  // final Widget text1;
  final Widget price;
  final String imageUrl;
  const ContainerWider(this.price, this.text0, this.imageUrl, {super.key});

  @override
  State<ContainerWider> createState() => _ContainerWiderState();
}

class _ContainerWiderState extends State<ContainerWider> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width ;
    double height = MediaQuery.of(context).size.height * 0.3;
    return Container(
      margin: const EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width ,
      height: MediaQuery.of(context).size.height * 0.32,
      // decoration: BoxDecoration(
      //   border: GradientBoxBorder(
      //     gradient: LinearGradient(colors: [orange, yellow]),
      //     width: 0.7,
      //   ),
      //   color: widget.color,
      //   borderRadius: BorderRadius.circular(10),
      // ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
              ),
              height: height * 0.82,
              width: width ,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: Image(
                  image: AssetImage(widget.imageUrl),
                  width: width,
                  height: height * 0.81,
                  fit: BoxFit.cover,
                ),
              ),
              // add image as child
            ),
            Container(
              width: width,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                border: GradientBoxBorder(
                  gradient: LinearGradient(colors: [orange, yellow]),
                  width: 0.5,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    widget.text0,
                    // widget.text1,
                    const SizedBox(
                      height: 8,
                    ),
                    widget.price,
                  ],
                ),
              ),
            )
          ]),
    );
  }
}

class Cardforsearchpage extends StatefulWidget {
  final Widget text0;
  final Widget text1;
  final Widget price;
  final String imageUrl;
  const Cardforsearchpage(this.price, this.text0, this.text1,
      {super.key, required this.imageUrl});

  @override
  State<Cardforsearchpage> createState() => _CardforsearchpageState();
}

class _CardforsearchpageState extends State<Cardforsearchpage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.45;
    double height = MediaQuery.of(context).size.height * 0.3;
    return GestureDetector(
      onTap: () {
        // Navigator.of(context, rootNavigator: true)
        //     .push(MaterialPageRoute(builder: (context) => AddPage()));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          margin: const EdgeInsets.only(
            top: 12,
          ),
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(10),
            border: GradientBoxBorder(
              gradient: LinearGradient(colors: [orange, yellow]),
              width: 0.7,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                ),
                height: height * 0.5,
                width: width,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: Image(
                    image: AssetImage(widget.imageUrl),
                    width: width,
                    height: height * 0.81,
                    fit: BoxFit.cover,
                  ),
                ),
                // add image as child
                // child: Image(image: AssetImage('pic.png'))
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    widget.text0,
                    widget.text1,
                    SizedBox(
                      height: 16,
                    ),
                    widget.price,
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class GradientBoxwithIcon extends StatefulWidget {
  final Widget text0;
  final Widget text1;
  final Icon icon;
  const GradientBoxwithIcon(
      {super.key,
      required this.text0,
      required this.text1,
      required this.icon});

  @override
  State<GradientBoxwithIcon> createState() => _GradientBoxwithIconState();
}

class _GradientBoxwithIconState extends State<GradientBoxwithIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 12,
      ),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(10),
        border: GradientBoxBorder(
          gradient: LinearGradient(colors: [orange, yellow]),
          width: 0.5,
        ),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 8.0, top: 16, right: 16, bottom: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          IconShader(icon: widget.icon,),
          SizedBox(height: 10,),
          widget.text0,
          SizedBox(height: 6,),
          widget.text1,
        ]),
      ),
    );
  }
}

class MapContainer extends StatefulWidget {
  final Widget place;
  final Widget place2;
  final String imageUrl;
  const MapContainer(
    this.imageUrl,
    this.place2, {
    super.key,
    required this.place,
  });

  @override
  State<MapContainer> createState() => _MapContainerState();
}

class _MapContainerState extends State<MapContainer> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.9;
    double height = MediaQuery.of(context).size.height * 0.3;
    return GestureDetector(
      onTap: () {
        // Navigator.of(context, rootNavigator: true)
        //     .push(MaterialPageRoute(builder: (context) => AddPage()));
      },
      child: Container(
        margin: const EdgeInsets.all(0),
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.32,
        // decoration: BoxDecoration(
        //   border: GradientBoxBorder(
        //     gradient: LinearGradient(colors: [orange, yellow]),
        //     width: 0.7,
        //   ),
        //   color: widget.color,
        //   borderRadius: BorderRadius.circular(10),
        // ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                ),
                height: height * 0.81,
                width: width * 1.1,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: Image(
                    image: AssetImage(widget.imageUrl),
                    width: width,
                    height: height * 0.81,
                    fit: BoxFit.cover,
                  ),
                ),
                // add image as child
              ),
              Container(
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  border: GradientBoxBorder(
                    gradient: LinearGradient(colors: [orange, yellow]),
                    width: 0.7,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      widget.place,
                      // widget.text0,
                      // widget.text1,
                      const SizedBox(
                        height: 4,
                      ),
                      widget.place2
                    ],
                  ),
                ),
              )
            ]),
      ),
    );
  }
}

class ReviewCard extends StatefulWidget {
  final String name;
  const ReviewCard(this.name, {super.key});

  @override
  State<ReviewCard> createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.65;
    double height = MediaQuery.of(context).size.height * 0.4;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(10),
          border: GradientBoxBorder(
            gradient: LinearGradient(colors: [orange, yellow]),
            width: 0.7,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15), color: trans),
                      child: ClipRRect(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                      child: const Image(
                        image: AssetImage(
                            'lib/images/profilepic.png'), //fourthpagepic
                        fit: BoxFit.contain,
                      ),
                    ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      textScaleFactor: 0.9,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const Text(
                      '5 days ago',
                      textScaleFactor: 0.6,
                    )
                  ],
                ),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                    color: black.withOpacity(0.03),
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                      children: [
                        IconShader(
                                icon: Icon(
                              Icons.star,
                              color: white,
                              size: 12,
                            )),
                            IconShader(
                                icon: Icon(
                              Icons.star,
                              color: white,
                              size: 12,
                            )),
                            IconShader(
                                icon: Icon(
                              Icons.star,
                              color: white,
                              size: 12,
                            )),
                            IconShader(
                                icon: Icon(
                              Icons.star,
                              color: white,
                              size: 12,
                            )),
                            IconShader(
                                icon: Icon(
                              Icons.star,
                              color: black.withOpacity(0.12),
                              size: 12,
                            )),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: width / 2.5,
                    height: width/3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                      child: const Image(
                        image: AssetImage(
                            'lib/images/review1.png'), //fourthpagepic
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    width: width / 2.5,
                    height: width/3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
                      child: const Image(
                        image: AssetImage(
                            'lib/images/review2.png'), //fourthpagepic
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // const Spacer(),
            SizedBox(height: 5,),
            Container(
              child: const Text(
                'Join me on a hike to Mumbai\'s most exciting mountain toinitely traditionally meal prepared by them... read more',
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                textScaleFactor: 0.6,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class paywalaContainer extends StatefulWidget {
  final String primarytext;
  final String secondarytext;
  final Icon icon;
  const paywalaContainer(
      {super.key,
      required this.primarytext,
      required this.secondarytext,
      required this.icon});

  @override
  State<paywalaContainer> createState() => _paywalaContainerState();
}

class _paywalaContainerState extends State<paywalaContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                child: IconShader(icon: widget.icon),
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.primarytext,
                textScaleFactor: 0.8,
              ),
              Text(
                widget.secondarytext,
                textScaleFactor: 0.6,
                style: TextStyle(fontWeight: FontWeight.w300),
              )
            ],
          )
        ],
      ),
    );
  }
}

class SettingTabProfilePage extends StatelessWidget {
  final String name;
  final Widget widget;
  const SettingTabProfilePage({super.key, required this.name, required this.widget});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>widget));
      },
      child: AbsorbPointer(
        child: Padding(
                          padding: const EdgeInsets.only(left:16.0,right: 16.0,top:12,bottom: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(name,style: profileSettingTab,textScaleFactor: 1,),
                              Icon(Entypo.right_open_big,size: 16,color: black.withOpacity(0.3),),
                            ],
                          ),
                        ),
      ),
    );
  }
}

// class RaisedGradientButton extends StatelessWidget {
//   final Widget child;
//   final Gradient gradient;
//   final double width;
//   final double height;
//   final Function onPressed;

//   const RaisedGradientButton({
   
//     required this.child,
//     required this.gradient,
//     this.width = double.infinity,
//     this.height = 50.0,
//     required this.onPressed,
//   }) ;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: width,
//       height: 50.0,
//       decoration: BoxDecoration(gradient: gradient, boxShadow: [
//         BoxShadow(
//           color: Colors.grey,
//           offset: Offset(0.0, 1.5),
//           blurRadius: 1.5,
//         ),
//       ]),
//       child: Material(
//         color: Colors.transparent,
//         child: InkWell(
//             onTap: onPressed,
//             child: Center(
//               child: child,
//             )),
//       ),
//     );
//   }
// }