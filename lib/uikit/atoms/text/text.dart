import 'package:crypto_watcher/uikit/styles/styles.dart';
import 'package:crypto_watcher/uikit/styles/text_theme.dart';
import 'package:flutter/material.dart';

class TextBody extends Text {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  final TextStyle? ownStyle;

  TextBody(
    this.text, {
    this.color,
    super.key,
    super.textAlign,
    super.textDirection,
    super.overflow,
    this.fontSize,
    this.fontWeight,
    this.ownStyle,
  }) : super(
          text,
          style: textTheme.bodyText1
              ?.copyWith(
                color: color,
                fontSize: fontSize,
                fontWeight: fontWeight,
              )
              .merge(ownStyle),
        );

  factory TextBody.thin(
    String text, {
    Key? key,
    Color? color,
    double? fontSize,
    TextAlign? textAlign,
    TextStyle? style,
    TextOverflow? overflow,
  }) =>
      TextBody(
        text,
        key: key,
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w100,
        textAlign: textAlign,
        ownStyle: style,
        overflow: overflow,
      );

  factory TextBody.extraLight(
    String text, {
    Key? key,
    Color? color,
    double? fontSize,
    TextAlign? textAlign,
    TextStyle? style,
    TextOverflow? overflow,
  }) =>
      TextBody(
        text,
        key: key,
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w200,
        textAlign: textAlign,
        ownStyle: style,
        overflow: overflow,
      );

  factory TextBody.light(
    String text, {
    Key? key,
    Color? color,
    double? fontSize,
    TextAlign? textAlign,
    TextStyle? style,
    TextOverflow? overflow,
  }) =>
      TextBody(
        text,
        key: key,
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w300,
        textAlign: textAlign,
        ownStyle: style,
        overflow: overflow,
      );

  factory TextBody.medium(
    String text, {
    Key? key,
    Color? color,
    double? fontSize,
    TextAlign? textAlign,
    TextStyle? style,
    TextOverflow? overflow,
  }) =>
      TextBody(
        text,
        key: key,
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
        textAlign: textAlign,
        ownStyle: style,
        overflow: overflow,
      );

  factory TextBody.semiBold(
    String text, {
    Key? key,
    Color? color,
    double? fontSize,
    TextAlign? textAlign,
    TextStyle? style,
    TextOverflow? overflow,
  }) =>
      TextBody(
        text,
        key: key,
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        textAlign: textAlign,
        ownStyle: style,
        overflow: overflow,
      );

  factory TextBody.bold(
    String text, {
    Key? key,
    Color? color,
    double? fontSize,
    TextAlign? textAlign,
    TextStyle? style,
    TextOverflow? overflow,
  }) =>
      TextBody(
        text,
        key: key,
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        textAlign: textAlign,
        ownStyle: style,
        overflow: overflow,
      );

  factory TextBody.extraBold(
    String text, {
    Key? key,
    Color? color,
    double? fontSize,
    TextAlign? textAlign,
    TextStyle? style,
    TextOverflow? overflow,
  }) =>
      TextBody(
        text,
        key: key,
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w800,
        textAlign: textAlign,
        ownStyle: style,
        overflow: overflow,
      );

  factory TextBody.black(
    String text, {
    Key? key,
    Color? color,
    double? fontSize,
    TextAlign? textAlign,
    TextStyle? style,
    TextOverflow? overflow,
  }) =>
      TextBody(
        text,
        key: key,
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w900,
        textAlign: textAlign,
        ownStyle: style,
        overflow: overflow,
      );
}
