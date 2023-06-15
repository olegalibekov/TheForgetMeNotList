import 'package:flutter/material.dart';
import 'package:the_forget_me_not_list/feature/main_screen/presentation/widgets/list_item.dart';
import 'package:the_forget_me_not_list/runner/runner.dart';
import 'package:the_forget_me_not_list/theme/custom_theme.dart';

class TaskImportance extends StatefulWidget {
  const TaskImportance({super.key});

  @override
  State<TaskImportance> createState() => _TaskImportanceState();
}

class _TaskImportanceState extends State<TaskImportance> {
  Importance selectedMenu = Importance.notSpecified;

  @override
  Widget build(BuildContext context) {
    final currentTheme = CustomTheme.fetchCurrentTheme();
    final colors = currentTheme.customColors;

    return PopupMenuButton(
      initialValue: selectedMenu,
      onSelected: (Importance item) {
        logger.i(item);
        setState(() {
          selectedMenu = item;
        });
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<Importance>>[
        PopupMenuItem<Importance>(
          value: Importance.notSpecified,
          child: Text(
            'Нет',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: colors.labelPrimary,
            ),
          ),
        ),
        PopupMenuItem<Importance>(
          value: Importance.low,
          child: Text(
            'Низкий',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: colors.labelPrimary,
            ),
          ),
        ),
        PopupMenuItem<Importance>(
          value: Importance.high,
          child: Text(
            '!! Высокий',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: colors.red,
            ),
          ),
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Важность',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: colors.labelPrimary,
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            switch (selectedMenu) {
              Importance.notSpecified => 'Нет',
              Importance.low => 'Низкий',
              Importance.high => 'Высокий'
            },
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: colors.labelTertiary,
            ),
          ),
        ],
      ),
    );
  }
}
