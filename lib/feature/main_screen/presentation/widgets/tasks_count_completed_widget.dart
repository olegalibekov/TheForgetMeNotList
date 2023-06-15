import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_forget_me_not_list/gen/assets.gen.dart';
import 'package:the_forget_me_not_list/theme/custom_theme.dart';

class TasksCountCompletedWidget extends StatelessWidget {
  const TasksCountCompletedWidget({super.key, required this.completedTasks});

  final int completedTasks;
  @override
  Widget build(BuildContext context) {
    final currentTheme = CustomTheme.fetchCurrentTheme();
    final colors = currentTheme.customColors;
    final typography = currentTheme.customTypography;
    return Row(
      children: [
        const SizedBox(width: 60.0),
        Text(
          'Выполнено — $completedTasks',
          style: typography.body.copyWith(color: colors.labelTertiary),
        ),
        const Spacer(),
        const SizedBox(width: 16.0),
        const VisibilityIcon(),
        const SizedBox(width: 24.0),
      ],
    );
  }
}

class VisibilityIcon extends StatefulWidget {
  const VisibilityIcon({super.key});

  @override
  State<VisibilityIcon> createState() => _VisibilityIconState();
}

class _VisibilityIconState extends State<VisibilityIcon> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    final currentTheme = CustomTheme.fetchCurrentTheme();
    final colors = currentTheme.customColors;
    return GestureDetector(
      onTap: () {
        setState(() => isVisible = !isVisible);
      },
      child: SvgPicture.asset(isVisible ? Assets.svg.visibility : Assets.svg.visibilityOff,
          colorFilter: ColorFilter.mode(
            colors.blue,
            BlendMode.srcIn,
          )),
    );
  }
}
