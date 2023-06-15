import 'package:flutter/material.dart';
import 'package:the_forget_me_not_list/feature/main_screen/presentation/widgets/custom_sliver_app_bar.dart';
import 'package:the_forget_me_not_list/feature/main_screen/presentation/widgets/floating_action_button.dart';
import 'package:the_forget_me_not_list/feature/main_screen/presentation/widgets/list_item.dart';
import 'package:the_forget_me_not_list/feature/main_screen/presentation/widgets/list_item_add_new.dart';
import 'package:the_forget_me_not_list/feature/main_screen/presentation/widgets/tasks_count_completed_widget.dart';
import 'package:the_forget_me_not_list/states/tasks_state/tasks_state.dart';
import 'package:the_forget_me_not_list/theme/custom_theme.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  static const path = '/';
  static const name = 'MainScreen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = CustomTheme.fetchCurrentTheme();
    final colors = currentTheme.customColors;

    return Scaffold(
      backgroundColor: colors.backPrimary,
      body: StreamBuilder<TaskEvents>(
          stream: TasksState.instance.fetchStreamController().stream,
          builder: (context, snapshot) {
            final tasksList = TasksState.instance.fetchList();
            final completedTasks = TasksState.instance.fetchCompletedTasks();
            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              slivers: <Widget>[
                SliverPersistentHeader(
                  delegate: CustomSliverAppBar(),
                  pinned: true,
                ),
                SliverToBoxAdapter(
                  child: TasksCountCompletedWidget(
                    completedTasks: completedTasks.length,
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 16.0)),
                if (tasksList.isNotEmpty)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: colors.backSecondary,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: tasksList.length + 1,
                            itemBuilder: (context, index) {
                              if (index + 1 == tasksList.length + 1) {
                                return const CustomListItemAddNew();
                              }
                              return CustomListItem(
                                index: index,
                                taskModel: tasksList[index],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                const SliverToBoxAdapter(child: SizedBox(height: 12.0)),
              ],
            );
          }),
      floatingActionButton: const CustomFloatingActionButton(),
    );
  }
}
