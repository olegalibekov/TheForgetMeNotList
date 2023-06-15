import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:the_forget_me_not_list/app.dart';
import 'package:flutter/services.dart';
import 'package:the_forget_me_not_list/theme/custom_theme.dart';

final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 2,
    errorMethodCount: 8,
    lineLength: 120,
    colors: true,
    printTime: false,
  ),
);

@immutable
final class Runner {
  static void run() {
    final currentTheme = CustomTheme.fetchCurrentTheme();
    final colors = currentTheme.customColors;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: colors.backPrimary, // status bar color
    ));
    runZonedGuarded(() {
      final stopWatch = Stopwatch()..start();
      try {
        runApp(const Application());
      } finally {
        logger.i('Time to start: ${stopWatch.elapsedMilliseconds} ms');
        stopWatch.stop();
      }
    }, (error, stack) {
      logger.e(error);
    });
  }
}
