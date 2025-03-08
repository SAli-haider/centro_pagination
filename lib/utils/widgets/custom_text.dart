import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../pallets/pallets.dart';

class CustomText {
  static Widget customText({
    required String text,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    TextDecoration? textDecoration,
  }) {
    return Text(
      text,
      style: GoogleFonts.roboto(
        color: color ?? Pallets.primaryText,
        fontSize: fontSize ?? 13.sp,
        fontWeight: fontWeight ?? FontWeight.normal,
        decoration: textDecoration,
      ),
      textAlign: textAlign ?? TextAlign.start,
      overflow: overflow ?? TextOverflow.clip,
      maxLines: maxLines,
    );
  }

  static Widget customTextLilTaOne({
    required String text,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    TextDecoration? textDecoration,
  }) {
    return Text(
      text,
      style: GoogleFonts.carroisGothic(
        color: color ?? Pallets.primaryText,
        fontSize: fontSize ?? 13.sp,
        fontWeight: fontWeight ?? FontWeight.normal,
        decoration: textDecoration,
      ),
      textAlign: textAlign ?? TextAlign.start,
      overflow: overflow ?? TextOverflow.clip,
      maxLines: maxLines,
    );
  }
}
