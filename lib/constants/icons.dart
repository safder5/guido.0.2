import 'package:flutter/material.dart';
import 'package:guido/constants/colors.dart';

class IconShader extends StatefulWidget {
  final Icon icon;
  const IconShader({required this.icon, super.key});

  @override
  State<IconShader> createState() => _IconShaderState();
}

class _IconShaderState extends State<IconShader> {
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: <Color>[
            orange,
            yellow,
          ],
          tileMode: TileMode.mirror,
        ).createShader(bounds);
      },
      child: widget.icon,
    );
  }
}

class TextShader extends StatefulWidget {
  final Widget text;
  const TextShader(this.text,{super.key, });

  @override
  State<TextShader> createState() => _TextShaderState();
}

class _TextShaderState extends State<TextShader> {
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: <Color>[
            orange,
            yellow,
          ],
          tileMode: TileMode.mirror,
        ).createShader(bounds);
      },
      child: widget.text,
    );
  }
}

