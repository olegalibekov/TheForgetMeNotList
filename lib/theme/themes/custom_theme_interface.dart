import 'package:flutter/material.dart';
import 'package:the_forget_me_not_list/theme/colors/custom_colors_interface.dart';
import 'package:the_forget_me_not_list/theme/typography/custom_typography_interface.dart';

@immutable
abstract interface class CustomThemeInterface {
  late final CustomColorsInterface customColors;
  late final CustomTypographyInterface customTypography;

  ThemeData get themeData;
}
