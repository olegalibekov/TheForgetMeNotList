import 'package:flutter/material.dart';
import 'package:the_forget_me_not_list/theme/colors/custom_colors_interface.dart';

@immutable
class CustomLightThemeColors implements CustomColorsInterface {
  @override
  final Color supportSeparator = const Color(0xFF000000).withOpacity(0.2);
  @override
  final Color supportOverlay = const Color(0xFF000000).withOpacity(0.06);
  @override
  final Color labelPrimary = const Color(0xFF000000);
  @override
  final Color labelSecondary = const Color(0xFF000000).withOpacity(0.6);
  @override
  final Color labelTertiary = const Color(0xFF000000).withOpacity(0.3);
  @override
  final Color labelDisable = const Color(0xFF000000).withOpacity(0.15);

  @override
  final Color red = const Color(0xFFFF3B30);
  @override
  final Color green = const Color(0xFF34C759);
  @override
  final Color blue = const Color(0xFF007AFF);
  @override
  final Color gray = const Color(0xFF8E8E93);
  @override
  final Color grayLight = const Color(0xFFD1D1D6);
  @override
  final Color white = const Color(0xFFFFFFFF);

  @override
  final Color backPrimary = const Color(0xFFF7F6F2);
  @override
  final Color backSecondary = const Color(0xFFFFFFFF);
  @override
  final Color elevated = const Color(0xFFFFFFFF);
}
