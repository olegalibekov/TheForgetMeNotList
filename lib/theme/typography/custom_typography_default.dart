import 'package:flutter/material.dart';
import 'package:the_forget_me_not_list/theme/typography/custom_typography_interface.dart';

@immutable
interface class CustomTypographyDefault implements CustomTypographyInterface {
  @override
  final TextStyle largeTitle = const TextStyle(fontSize: 32.0, fontWeight: FontWeight.w500, height: 1.19);
  @override
  final TextStyle title = const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500, height: 1.60);
  @override
  final TextStyle button = const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, height: 1.71);
  @override
  final TextStyle body = const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400, height: 1.25);
  @override
  final TextStyle subhead = const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, height: 1.43);
}
