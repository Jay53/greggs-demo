import 'package:flutter/material.dart';
import 'package:greggs/app/config/app_colors.dart';
import 'package:greggs/app/config/app_fonts.dart';

class MyText extends StatelessWidget {
  final String data;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final double? letterSpacing;
  final TextOverflow? overflow;
  final int? maxLines;
  final double? height;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;

  const MyText(
    this.data, {
    Key? key,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.letterSpacing,
    this.overflow,
    this.maxLines,
    this.height,
    this.textAlign,
    this.textDecoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        color: color ?? AppColors.black,
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight ?? fwRegular,
        letterSpacing: letterSpacing,
        decoration: textDecoration,
        height: height,
      ),
    );
  }
}
