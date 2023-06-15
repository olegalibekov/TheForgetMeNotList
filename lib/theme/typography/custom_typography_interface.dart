import 'package:flutter/material.dart';

@immutable
abstract interface class CustomTypographyInterface {
  TextStyle get largeTitle;
  TextStyle get title;
  TextStyle get button;
  TextStyle get body;
  TextStyle get subhead;
}