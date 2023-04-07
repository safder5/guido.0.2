import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:guido/constants/colors.dart';

class BorderGradientButton extends StatefulWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double? height;
  final Gradient gradient;
  final VoidCallback? onPressed;
  final Widget child;

  const BorderGradientButton({
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
  State<BorderGradientButton> createState() => _BorderGradientButtonState();
}

class _BorderGradientButtonState extends State<BorderGradientButton> {
  @override
  Widget build(BuildContext context) {
    final borderRadius = widget.borderRadius ?? BorderRadius.circular(0);
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        border: GradientBoxBorder(gradient: widget.gradient, width: 0.7),
        borderRadius: borderRadius,
      ),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: widget.child,
      ),
    );
  }
}

class BorderGradientButtonTwo extends StatefulWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double? height;
  final Gradient gradient;
  final VoidCallback? onPressed;
  final Widget child;
  final Color color;

  const BorderGradientButtonTwo({
    Key? key,
    required this.onPressed,
    required this.child,
    this.borderRadius,
    this.width,
    this.height,
    this.gradient =
        const LinearGradient(colors: [Color(0xFFF98174), Color(0xffFFD300)]), required this.color,
  }) : super(key: key);

  @override
  State<BorderGradientButtonTwo> createState() =>
      _BorderGradientButtonTwoState();
}

class _BorderGradientButtonTwoState extends State<BorderGradientButtonTwo> {
  @override
  Widget build(BuildContext context) {
    final borderRadius = widget.borderRadius ?? BorderRadius.circular(0);
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: widget.color,
        border: GradientBoxBorder(gradient: widget.gradient, width: 0.7),
        borderRadius: borderRadius,
      ),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: widget.child,
      ),
    );
  }
}
