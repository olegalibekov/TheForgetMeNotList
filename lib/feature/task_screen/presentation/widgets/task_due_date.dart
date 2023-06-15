import 'package:flutter/material.dart';
import 'package:the_forget_me_not_list/const/month_names.dart';
import 'package:the_forget_me_not_list/theme/custom_theme.dart';

class TaskDueDate extends StatefulWidget {
  const TaskDueDate({super.key});

  @override
  State<TaskDueDate> createState() => _TaskDueDateState();
}

class _TaskDueDateState extends State<TaskDueDate> {
  bool isSwitched = true;
  DateTime currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final currentTheme = CustomTheme.fetchCurrentTheme();
    final colors = currentTheme.customColors;

    return Row(
      children: [
        GestureDetector(
          onTap: () async {
            if (isSwitched == true) {
              final pickedDate = await _selectDate(context);
              if (pickedDate != null) {
                setState(() => currentDate = pickedDate);
              }
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Сделать до',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.17,
                  fontWeight: FontWeight.w400,
                  color: colors.labelPrimary,
                ),
              ),
              if (isSwitched) ...[
                const SizedBox(height: 4.0),
                Text(
                  '${currentDate.day} ${MonthNames.fetchMonthName(currentDate.month)} ${currentDate.year}',
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.17,
                    fontWeight: FontWeight.w400,
                    color: colors.blue,
                  ),
                ),
              ]
            ],
          ),
        ),
        Spacer(),
        Switch(
          value: isSwitched,
          onChanged: (value) {
            if (value == true) {
              currentDate = DateTime.now();
            }
            setState(() => isSwitched = value);
          },
        ),
      ],
    );
  }

  Future<DateTime?> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2015),
      lastDate: DateTime(2050),
    );
    if (pickedDate != null && pickedDate != currentDate) {
      return pickedDate;
    }
    return null;
  }
}
