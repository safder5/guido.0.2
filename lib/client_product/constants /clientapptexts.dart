import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:guido/constants/colors.dart';
import 'package:guido/constants/icons.dart';
import 'package:guido/selectionpage.dart';

TextStyle bigboldlibre = GoogleFonts.libreBaskerville(
    textStyle: TextStyle(fontWeight: FontWeight.w600));
TextStyle bigboldlibrreWhite = GoogleFonts.libreBaskerville(
    textStyle: TextStyle(fontWeight: FontWeight.w600, color: Colors.white));
TextStyle tinylighttext = GoogleFonts.libreBaskerville(
    textStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.black45));

class ContainerSetupsteps extends StatefulWidget {
  final String stepnumber;
  final String title;
  final String subtitle;
  const ContainerSetupsteps(
      {super.key,
      required this.stepnumber,
      required this.title,
      required this.subtitle});

  @override
  State<ContainerSetupsteps> createState() => _ContainerSetupstepsState();
}

class _ContainerSetupstepsState extends State<ContainerSetupsteps> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right:8.0),
      child: Stack(
        children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.55,
            height: MediaQuery.of(context).size.width * 0.7,
            color: white,
          child: Padding(
            padding: const EdgeInsets.only(left:10.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.55,
              height: MediaQuery.of(context).size.width * 0.7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: GradientBoxBorder(
                    gradient: LinearGradient(colors: [orange, yellow])),
              ),
              padding: EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: GoogleFonts.inter(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.subtitle,
                    style: GoogleFonts.inter(
                        textStyle: TextStyle(fontWeight: FontWeight.w200)),
                    textScaleFactor: 0.9,
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
            top: MediaQuery.of(context).size.width * 0.35,
            left: -3,
            child: Container(
              width: 30,
                decoration: BoxDecoration(
                  color: white,
                    shape: BoxShape.circle,
                    border: Border.all(color: orange)),
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Center(
                    child: Text(
                      widget.stepnumber,
                      style: TextStyle(color: orange),
                    ),
                  ),
                ))),
      ]),
    );
  }
}
