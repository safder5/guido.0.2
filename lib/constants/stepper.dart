import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guido/constants/colors.dart';

class StepProgressView extends StatelessWidget {
  final double _width;

  final List<String> _titles;
  final int _curStep;
  final Color _activeColor;
  final Color _inactiveColor = Colors.black12;
  final double lineWidth = 3.0;
  final Gradient _gradient;
  final Gradient _ungradient;

  StepProgressView({
    required int curStep,
    required List<String> titles,
    required double width,
    required Color color,
    required Gradient gradient,
    required Gradient ungradient,
  })  : _titles = titles,
        _curStep = curStep,
        _width = width,
        _activeColor = color,
        _gradient = gradient,
        _ungradient = ungradient,
        assert(width > 0);

  Widget build(BuildContext context) {
    return Container(
        width: this._width,
        child: Column(
          children: <Widget>[
            Row(
              children: _iconViews(),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _titleViews(),
            ),
          ],
        ));
  }

  List<Widget> _iconViews() {
    var list = <Widget>[];
    _titles.asMap().forEach((i, icon) {
      var circleColor =
          (i == 0 || _curStep > i + 1) ? _activeColor : _inactiveColor;
      var lineColor = _curStep > i + 1 ? _activeColor : _inactiveColor;
      var iconColor =
          (i == 0 || _curStep > i + 1) ? _activeColor : _inactiveColor;
      var grad = (i == 0 || _curStep > i + 1) ? _gradient : _ungradient;
      var dotcolor =
          (i == 0 || _curStep > i + 1) ? Colors.white : Colors.transparent;
      list.add(Container(
        height: lineWidth,
        color: lineColor,
        width: 24,
      ));
      list.add(
        Container(
          width: 20.0,
          height: 20.0,
          padding: EdgeInsets.all(0),
          decoration:  BoxDecoration(
            gradient: grad,
            /* color: circleColor,*/
            borderRadius:  BorderRadius.all( Radius.circular(12.0)),
            // border: new Border.all(
            //   color: circleColor,
            //   width: 2.0,
            // ),
          ),
          child: Icon(
            Icons.circle,
            color: dotcolor,
            size: 12.0,
          ),
        ),
      );

      //line between icons
      if (i != _titles.length - 1) {
        list.add(Expanded(
            child: Container(
          height: lineWidth,
          color: lineColor,
        )));
      }
    });


    return list;
  }

  List<Widget> _titleViews() {
    var list = <Widget>[];
    _titles.asMap().forEach((i, text) {
      list.add(Padding(
        padding: const EdgeInsets.only(left:8.0),
        child: Container(
          width: 48,
          child: Text(
            text,
            textScaleFactor: 0.6,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w200),
            overflow: TextOverflow.clip,
            textAlign: TextAlign.center,
          ),
        ),
      ));
    });
    return list;
  }
}
