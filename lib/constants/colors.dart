import 'package:flutter/material.dart';

Color white = Colors.white;
Color black = Colors.black;
Color orange = Color(0xFFF98174);
Color yellow = Color(0xffFFD300);
Color bluegrey = Colors.blueGrey.shade200;
Color grey = Color(0xFFD9D9D9);
Color trans = Colors.transparent;
Color red = Colors.red;
Color pink = Colors.pink;
Color purple = Colors.purple;
Color blue = Colors.blue;
Color bg = Color(0xFFF4F5FB);

const MaterialColor primaryBlack = MaterialColor(
  _blackPrimaryValue,
  <int, Color>{
    50: Color(0xFF000000),
    100: Color(0xFF000000),
    200: Color(0xFF000000),
    300: Color(0xFF000000),
    400: Color(0xFF000000),
    500: Color(_blackPrimaryValue),
    600: Color(0xFF000000),
    700: Color(0xFF000000),
    800: Color(0xFF000000),
    900: Color(0xFF000000),
  },
);
const int _blackPrimaryValue = 0xFF000000;

// ignore: prefer_const_constructors
Gradient a = LinearGradient(
    colors: [orange, yellow],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    tileMode: TileMode.mirror);

Text sos = Text(
  'Emergency SOS',
  style: TextStyle(color: Colors.red),
);

TextStyle profileSettingTab = TextStyle(fontWeight: FontWeight.w300);
// style: const TextStyle(color: Colors.white,fontSize: 30),

// GradientText('Explore', gradient: LinearGradient(colors: [orange, yellow]));

// ShaderMask(
//               shaderCallback: ( bounds) {
//                 return LinearGradient(
//                 begin: Alignment.centerLeft,
//                 end: Alignment.centerRight,
//                   colors: <Color>[
//                     yellow,
//                     orange
//                   ],
//                   tileMode: TileMode.mirror,
//                 ).createShader(bounds);
//               },
//               child: const Text('Explore'),
//             ),

