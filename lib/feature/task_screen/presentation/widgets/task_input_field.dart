import 'package:flutter/material.dart';
import 'package:the_forget_me_not_list/theme/custom_theme.dart';

class TaskInputField extends StatelessWidget {
  const TaskInputField({super.key});

  @override
  Widget build(BuildContext context) {
    final currentTheme = CustomTheme.fetchCurrentTheme();
    final colors = currentTheme.customColors;

    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 104),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Color(0x1F000000),
              offset: Offset(0, 2),
              blurRadius: 2,
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Color(0x0F000000),
              offset: Offset(0, 0),
              blurRadius: 2,
              spreadRadius: 0,
            ),
          ],
        ),
        child: TextField(
          autofocus: false,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(16.0),
            isDense: true,
            border: InputBorder.none,
            hintText: 'Что надо сделать…',
            hintStyle: TextStyle(
              fontSize: 16,
              height: 1.125,
              fontWeight: FontWeight.w400,
              color: colors.labelTertiary,
            ),
          ),
          maxLines: null,
          style: TextStyle(
            fontSize: 16,
            height: 1.125,
            fontWeight: FontWeight.w400,
            color: colors.labelPrimary,
          ),
        ),
      ),
    );
  }
}
