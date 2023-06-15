import 'package:flutter/material.dart';
import 'package:the_forget_me_not_list/theme/colors/custom_colors_interface.dart';
import 'package:the_forget_me_not_list/theme/typography/custom_typography_interface.dart';

@immutable
class CustomLightThemeTypography implements CustomTypographyInterface {
  const CustomLightThemeTypography({
    required this.customTypography,
    required this.customColors,
  });

  final CustomTypographyInterface customTypography;
  final CustomColorsInterface customColors;

  Color get labelPrimary => customColors.labelPrimary;

  @override
  TextStyle get largeTitle => customTypography.largeTitle.copyWith(color: labelPrimary);
  @override
  TextStyle get title => customTypography.title.copyWith(color: labelPrimary);
  @override
  TextStyle get body => customTypography.body.copyWith(color: labelPrimary);
  @override
  TextStyle get button => customTypography.button.copyWith(color: labelPrimary);
  @override
  TextStyle get subhead => customTypography.subhead.copyWith(color: labelPrimary);
}
