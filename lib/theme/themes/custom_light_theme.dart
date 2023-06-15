import 'package:flutter/material.dart';
import 'package:the_forget_me_not_list/theme/colors/custom_colors_interface.dart';
import 'package:the_forget_me_not_list/theme/colors/custom_light_theme_colors.dart';
import 'package:the_forget_me_not_list/theme/themes/custom_theme_interface.dart';
import 'package:the_forget_me_not_list/theme/typography/custom_light_theme_typography.dart';
import 'package:the_forget_me_not_list/theme/typography/custom_typography_default.dart';
import 'package:the_forget_me_not_list/theme/typography/custom_typography_interface.dart';

@immutable
class CustomLightTheme implements CustomThemeInterface {
  static final instance = CustomLightTheme._();

  CustomLightTheme._() {
    customColors = CustomLightThemeColors();
    customTypography = CustomLightThemeTypography(
      customTypography: CustomTypographyDefault(),
      customColors: customColors,
    );
  }

  @override
  late final CustomColorsInterface customColors;
  @override
  late final CustomTypographyInterface customTypography;

  @override
  ThemeData get themeData {
    return ThemeData().copyWith(
        useMaterial3: false,
        brightness: Brightness.light,
        textTheme: TextTheme(
          titleLarge: customTypography.largeTitle,
          titleMedium: customTypography.title,
          labelSmall: customTypography.button,
          bodyLarge: customTypography.body,
          titleSmall: customTypography.subhead,
        ));
  }
}
