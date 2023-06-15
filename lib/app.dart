import 'package:flutter/material.dart';
import 'package:the_forget_me_not_list/feature/main_screen/presentation/main_screen.dart';
import 'package:the_forget_me_not_list/feature/task_screen/presentation/task_screen.dart';
import 'package:the_forget_me_not_list/runner/runner.dart';
import 'package:the_forget_me_not_list/theme/custom_theme.dart';

@immutable
class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomTheme.customLightTheme.themeData,
      initialRoute: MainScreen.path,
      onGenerateRoute: (settings) {
        final args = settings.arguments;
        if (settings.name == TaskScreen.path) {
          logger.i('route to ${TaskScreen.name}');
          final isDeletable = args as bool? ?? false;
          return MaterialPageRoute(
            builder: (context) {
              return TaskScreen(isDeletable: isDeletable);
            },
          );
        }
        return null;
      },
      routes: {
        MainScreen.path: (context) {
          logger.i('route to ${MainScreen.name}');
          return const MainScreen();
        }
      },
    );
  }
}
