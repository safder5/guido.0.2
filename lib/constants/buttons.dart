import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:guido/constants/colors.dart';

import 'container.dart';

class MyElevatedButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double? height;
  final Gradient gradient;
  final VoidCallback? onPressed;
  final Widget child;

  const MyElevatedButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.borderRadius,
    this.width,
    this.height,
    this.gradient =
        const LinearGradient(colors: [Color(0xFFF98174), Color(0xffFFD300)]),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(0);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: borderRadius,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: child,
      ),
    );
  }
}

class OutlineButtonWithGradient extends StatefulWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double? height;
  final Gradient gradient;
  final VoidCallback? onPressed;
  final Widget child;

  const OutlineButtonWithGradient({
    Key? key,
    required this.onPressed,
    required this.child,
    this.borderRadius,
    this.width,
    this.height,
    this.gradient =
        const LinearGradient(colors: [Color(0xFFF98174), Color(0xffFFD300)]),
  }) : super(key: key);
  @override
  State<OutlineButtonWithGradient> createState() =>
      _OutlineButtonWithGradientState();
}

class _OutlineButtonWithGradientState extends State<OutlineButtonWithGradient> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: GradientBoxBorder(gradient: widget.gradient, width: 0.8),
        borderRadius: widget.borderRadius,
      ),
      child: widget.child,
    );
  }
}

class OverviewSmallContainer extends StatefulWidget {
  final String headText;
  final String subText;
  final Icon icon;
  const OverviewSmallContainer({super.key, required this.headText, required this.subText, required this.icon});

  @override
  State<OverviewSmallContainer> createState() => _OverviewSmallContainerState();
}

class _OverviewSmallContainerState extends State<OverviewSmallContainer> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
                          width: width * 0.35,
                          child: GradientBoxwithIcon(
                            text0: Text(
                              widget.headText,
                              textScaleFactor: 0.8,
                            ),
                            text1: Text(
                              widget.subText,
                              textScaleFactor: 0.6,
                              maxLines: 3,
                              overflow: TextOverflow.fade,
                            ),
                            icon: widget.icon,
                          ),
                        ),
    );
  }
}