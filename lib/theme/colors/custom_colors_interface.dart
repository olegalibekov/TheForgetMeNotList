import 'package:flutter/material.dart';

@immutable
abstract interface class CustomColorsInterface {
  Color get supportSeparator;
  Color get supportOverlay;
  Color get labelPrimary;
  Color get labelSecondary;
  Color get labelTertiary;
  Color get labelDisable;
  Color get red;
  Color get green;
  Color get blue;
  Color get gray;
  Color get grayLight;
  Color get white;
  Color get backPrimary;
  Color get backSecondary;
  Color get elevated;
}
