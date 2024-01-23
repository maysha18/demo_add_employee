import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  const TextView({
    Key? key,
    required this.text,
    this.maxLines = -1,
    this.softWrap = false,
    this.textAlign = TextAlign.start,
    this.overflow = TextOverflow.ellipsis,
    this.fontFamily,
    this.fontSize = 12,
    this.height = 1.3846153846153846,
    this.color = Colors.black,
    this.fontStyle = FontStyle.normal,
    this.fontWeight = FontWeight.normal,
    this.decoration,
    this.onTap,
  }) : super(key: key);

  final String text;
  final int maxLines;
  final bool softWrap;
  final TextAlign textAlign;
  final TextOverflow? overflow;
  final decoration;
  final String? fontFamily;
  final double fontSize;
  final double height;
  final Color color;
  final FontStyle fontStyle;
  final FontWeight fontWeight;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        maxLines: maxLines == -1 ? null : maxLines,
        textAlign: textAlign,
        overflow: overflow,
        softWrap: softWrap,
        style: TextStyle(
          decoration: decoration ?? TextDecoration.none,
          fontFamily: fontFamily,
          fontSize: fontSize,
          color: color,
          fontStyle: fontStyle,
          height: height,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
