import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_forget_me_not_list/gen/assets.gen.dart';
import 'package:the_forget_me_not_list/theme/custom_theme.dart';

@immutable
class TaskDelete extends StatelessWidget {
  const TaskDelete({super.key, required this.isEnable});

  final bool isEnable;

  @override
  Widget build(BuildContext context) {
    final currentTheme = CustomTheme.fetchCurrentTheme();
    final colors = currentTheme.customColors;
    final typography = currentTheme.customTypography;

    return Row(
      children: [
        SvgPicture.asset(
          Assets.svg.delete,
          colorFilter: ColorFilter.mode(
            isEnable ? colors.red : colors.labelDisable,
            BlendMode.srcIn,
          ),
        ),
        const SizedBox(width: 12.0),
        Expanded(
          child: Text('Удалить',
              style: typography.body.apply(
                color: isEnable ? colors.red : colors.labelDisable,
              )),
        ),
      ],
    );
  }
}
