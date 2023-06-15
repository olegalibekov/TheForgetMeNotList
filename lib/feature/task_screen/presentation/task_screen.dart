import 'package:flutter/material.dart';
import 'package:the_forget_me_not_list/feature/task_screen/presentation/widgets/task_delete.dart';
import 'package:the_forget_me_not_list/feature/task_screen/presentation/widgets/task_due_date.dart';
import 'package:the_forget_me_not_list/feature/task_screen/presentation/widgets/task_importance.dart';
import 'package:the_forget_me_not_list/feature/task_screen/presentation/widgets/task_input_field.dart';
import 'package:the_forget_me_not_list/feature/task_screen/presentation/widgets/task_screen_app_bar.dart';
import 'package:the_forget_me_not_list/theme/custom_theme.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key, required this.isDeletable});

  final bool isDeletable;

  static const path = '/taskScreen';
  static const name = 'TaskScreen';

  @override
  Widget build(BuildContext context) {
    final currentTheme = CustomTheme.fetchCurrentTheme();
    final colors = currentTheme.customColors;

    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: colors.backPrimary,
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              const TaskScreenAppBar(),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(height: 8.0),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: TaskInputField(),
                    ),
                    const SizedBox(height: 12.0),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TaskImportance(),
                            const SizedBox(height: 16.0),
                            Divider(
                              height: 0.5,
                              color: colors.supportSeparator,
                            )
                          ],
                        ),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: TaskDueDate(),
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    Divider(
                      height: 0.5,
                      color: colors.supportSeparator,
                    ),
                    const SizedBox(height: 8.0),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: TaskDelete(
                          isEnable: isDeletable,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
