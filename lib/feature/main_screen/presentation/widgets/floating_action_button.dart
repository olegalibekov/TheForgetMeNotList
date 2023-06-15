import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_forget_me_not_list/feature/task_screen/presentation/task_screen.dart';
import 'package:the_forget_me_not_list/gen/assets.gen.dart';
import 'package:the_forget_me_not_list/theme/custom_theme.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    final currentTheme = CustomTheme.fetchCurrentTheme();
    final colors = currentTheme.customColors;
    return SizedBox(
      height: 56.0,
      width: 56.0,
      child: FittedBox(
        child: FloatingActionButton(
            tooltip: 'Добавить задачу',
            backgroundColor: colors.blue,
            onPressed: () {
              Navigator.pushNamed(context, TaskScreen.path);
            },
            child: SvgPicture.asset(Assets.svg.add,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ))),
      ),
    );
  }
}
