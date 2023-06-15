import 'package:flutter/material.dart';
import 'package:the_forget_me_not_list/theme/themes/custom_light_theme.dart';
import 'package:the_forget_me_not_list/theme/themes/custom_theme_interface.dart';

enum ThemeEnum { light, dark }

@immutable
abstract final class CustomTheme {
  const CustomTheme._();

  static final CustomThemeInterface customLightTheme = CustomLightTheme.instance;

  static CustomThemeInterface fetchCurrentTheme() {
    const currentTheme = ThemeEnum.light;
    switch (currentTheme) {
      case ThemeEnum.light:
        return customLightTheme;
      default:
        return customLightTheme;
    }
  }
}
