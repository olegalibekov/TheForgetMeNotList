import 'package:flutter/material.dart';
import 'package:the_forget_me_not_list/theme/colors/custom_colors_interface.dart';

@immutable
class CustomDarkThemeColors implements CustomColorsInterface {
  @override
  final Color supportSeparator = const Color(0xFFFFFFFF).withOpacity(0.2);
  @override
  final Color supportOverlay = const Color(0xFF000000).withOpacity(0.32);
  @override
  final Color labelPrimary = const Color(0xFFFFFFFF);
  @override
  final Color labelSecondary = const Color(0xFFFFFFFF).withOpacity(0.6);
  @override
  final Color labelTertiary = const Color(0xFFFFFFFF).withOpacity(0.4);
  @override
  final Color labelDisable = const Color(0xFFFFFFFF).withOpacity(0.15);

  @override
  final Color red = const Color(0xFFFF453A);
  @override
  final Color green = const Color(0xFF32D74B);
  @override
  final Color blue = const Color(0xFF0A84FF);
  @override
  final Color gray = const Color(0xFF8E8E93);
  @override
  final Color grayLight = const Color(0xFF48484A);
  @override
  final Color white = const Color(0xFFFFFFFF);

  @override
  final Color backPrimary = const Color(0xFF161618);
  @override
  final Color backSecondary = const Color(0xFF252528);
  @override
  final Color elevated = const Color(0xFF3C3C3F);
}
