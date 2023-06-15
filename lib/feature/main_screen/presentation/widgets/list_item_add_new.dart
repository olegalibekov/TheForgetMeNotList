import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_forget_me_not_list/feature/task_screen/presentation/task_screen.dart';
import 'package:the_forget_me_not_list/gen/assets.gen.dart';
import 'package:the_forget_me_not_list/runner/runner.dart';
import 'package:the_forget_me_not_list/theme/custom_theme.dart';

class CustomListItemAddNew extends StatefulWidget {
  const CustomListItemAddNew({super.key});

  @override
  State<CustomListItemAddNew> createState() => _CustomListItemState();
}

class _CustomListItemState extends State<CustomListItemAddNew> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = CustomTheme.fetchCurrentTheme();
    final typography = currentTheme.customTypography;
    final colors = currentTheme.customColors;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            TaskScreen.path,
            arguments: false,
          );
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(width: 36.0),
            Expanded(
              child: Text(
                'Новое',
                style: typography.body.copyWith(color: colors.labelTertiary),
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
