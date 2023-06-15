import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_forget_me_not_list/gen/assets.gen.dart';
import 'package:the_forget_me_not_list/theme/custom_theme.dart';

class TaskScreenAppBar extends StatelessWidget {
  const TaskScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final currentTheme = CustomTheme.fetchCurrentTheme();
    final colors = currentTheme.customColors;
    final typography = currentTheme.customTypography;

    return SliverAppBar(
      leading: const SizedBox.shrink(),
      pinned: true,
      floating: false,
      toolbarHeight: 26,
      collapsedHeight: 56,
      backgroundColor: colors.backPrimary,
      flexibleSpace: Center(
        child: Row(
          children: [
            const SizedBox(width: 16.0),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(
                Assets.svg.close,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                'Сохранить'.toUpperCase(),
                style: typography.button.apply(color: colors.blue),
              ),
            ),
            const SizedBox(width: 16.0),
          ],
        ),
      ),
    );
  }
}
