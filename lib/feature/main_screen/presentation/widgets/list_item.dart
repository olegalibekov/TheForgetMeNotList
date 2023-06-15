import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_forget_me_not_list/const/month_names.dart';
import 'package:the_forget_me_not_list/feature/task_screen/presentation/task_screen.dart';
import 'package:the_forget_me_not_list/gen/assets.gen.dart';
import 'package:the_forget_me_not_list/models/task_model.dart';
import 'package:the_forget_me_not_list/runner/runner.dart';
import 'package:the_forget_me_not_list/states/tasks_state/tasks_state.dart';
import 'package:the_forget_me_not_list/theme/custom_theme.dart';

enum Importance {
  notSpecified,
  low,
  high;

  bool get isNotSpecified => this == Importance.notSpecified;

  bool get isLow => this == Importance.low;

  bool get isHigh => this == Importance.high;
}

class CustomListItem extends StatefulWidget {
  const CustomListItem({
    super.key,
    required this.index,
    required this.taskModel,
  });

  final int index;
  final TaskModel taskModel;

  @override
  State<CustomListItem> createState() => _CustomListItemState();
}

class _CustomListItemState extends State<CustomListItem> {
  bool get isChecked => widget.taskModel.isCompleted;

  double dismissibleProgress = 0;

  @override
  Widget build(BuildContext context) {
    final currentTheme = CustomTheme.fetchCurrentTheme();
    final typography = currentTheme.customTypography;
    final colors = currentTheme.customColors;
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
      final width = constraints.maxWidth;
      return Dismissible(
        key: ValueKey(widget.taskModel),
        onUpdate: (dismissUpdateDetails) {
          setState(() => dismissibleProgress = dismissUpdateDetails.progress);
        },
        direction: DismissDirection.horizontal,
        background: Stack(
          alignment: Alignment.center,
          children: [
            Container(color: Colors.green),
            Positioned(
              left: width * dismissibleProgress - 24.0 - 24.0,
              child: SvgPicture.asset(
                Assets.svg.check,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
        secondaryBackground: Stack(
          alignment: Alignment.center,
          children: [
            Container(color: Colors.red),
            Positioned(
              right: width * dismissibleProgress - 24.0 - 24.0,
              child: SvgPicture.asset(
                Assets.svg.delete,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
        confirmDismiss: (direction) async {
          switch (direction) {
            case DismissDirection.startToEnd:
              {
                TasksState.instance.updateTaskCompletion(widget.taskModel, value: true);
                logger.i('Dismissed: checked');
                return false;
              }
            case DismissDirection.endToStart:
              {
                logger.i('Dismissed: deleted');
                return true;
              }
            default:
              return true;
          }
        },
        onDismissed: (direction) async {
          switch (direction) {
            case DismissDirection.endToStart:
              {
                TasksState.instance.removeTask(widget.taskModel);
              }
            default:
              {}
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  if (widget.taskModel.importance.isHigh)
                    Container(
                      height: 14.0,
                      width: 14.0,
                      color: const Color(0xFFFFE0DE),
                    ),
                  SizedBox(
                    height: 24.0,
                    width: 24.0,
                    child: Checkbox(
                      value: isChecked,
                      activeColor: colors.green,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                      side: MaterialStateBorderSide.resolveWith(
                        (states) => BorderSide(
                            width: 2.0,
                            color: isChecked
                                ? colors.green
                                : switch (widget.taskModel.importance) {
                                    Importance.notSpecified || Importance.low => colors.supportSeparator,
                                    Importance.high => colors.red
                                  }),
                      ),
                      onChanged: (newValue) {
                        TasksState.instance.updateTaskCompletion(widget.taskModel, value: newValue ?? false);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 12.0),
              if (widget.taskModel.importance.isHigh && !isChecked)
                SvgPicture.asset(
                  Assets.svg.priorityHigh,
                ),
              if (widget.taskModel.importance.isLow && !isChecked)
                SvgPicture.asset(
                  Assets.svg.priorityLow,
                ),
              if ((widget.taskModel.importance.isLow || widget.taskModel.importance.isLow) && !isChecked)
                const SizedBox(width: 3.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.taskModel.description,
                      style: typography.body.copyWith(
                        color: isChecked ? colors.labelTertiary : colors.labelPrimary,
                        decoration: isChecked ? TextDecoration.lineThrough : null,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                    if (widget.taskModel.dueDate != null) ...[
                      const SizedBox(height: 4.0),
                      Text(
                        '${widget.taskModel.dueDate?.day} ${MonthNames.fetchMonthName(widget.taskModel.dueDate?.month)} ${widget.taskModel.dueDate?.year}',
                        style: typography.subhead.copyWith(
                          color: colors.labelTertiary,
                          decoration: isChecked ? TextDecoration.lineThrough : null,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      const SizedBox(height: 2.0),
                    ]
                  ],
                ),
              ),
              const SizedBox(width: 12.0),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    TaskScreen.path,
                    arguments: true,
                  );
                },
                child: SvgPicture.asset(Assets.svg.infoOutline,
                    colorFilter: ColorFilter.mode(
                      colors.labelTertiary,
                      BlendMode.srcIn,
                    )),
              ),
            ],
          ),
        ),
      );
    });
  }
}
