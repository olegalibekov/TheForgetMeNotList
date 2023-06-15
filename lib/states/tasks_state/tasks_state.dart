import 'dart:async';

import 'package:the_forget_me_not_list/feature/main_screen/presentation/widgets/list_item.dart';
import 'package:the_forget_me_not_list/models/task_model.dart';
import 'package:the_forget_me_not_list/runner/runner.dart';

///
/// Temporary solution
///

enum TaskEvents { taskUpdate, taskRemove }

class TasksState {
  static final instance = TasksState._();

  TasksState._();

  final StreamController<TaskEvents> _streamController = StreamController();

  StreamController<TaskEvents> fetchStreamController() => _streamController;

  final List<TaskModel> _tasksList = [
    TaskModel(
      isCompleted: true,
      description: 'Купить что-то',
      importance: Importance.notSpecified,
    ),
    TaskModel(
      isCompleted: true,
      description: 'Купить что-то',
      importance: Importance.notSpecified,
    ),
    TaskModel(
      isCompleted: false,
      description: 'Купить что-то, где-то, зачем-то, но зачем не очень понятно',
      importance: Importance.notSpecified,
    ),
    TaskModel(
      isCompleted: false,
      description: 'Купить что-то, где-то, зачем-то, но зачем не очень понятно, но точно чтобы показать как обр…',
      importance: Importance.notSpecified,
    ),
    TaskModel(
      isCompleted: false,
      description: 'Купить что-то',
      importance: Importance.high,
    ),
    TaskModel(
      isCompleted: false,
      description: 'Купить что-то',
      importance: Importance.low,
    ),
    TaskModel(
      isCompleted: true,
      description: 'Купить что-то',
      importance: Importance.notSpecified,
    ),
  ];

  List<TaskModel> fetchList() => _tasksList;

  List<TaskModel> fetchCompletedTasks() => _tasksList.toList().where((element) => element.isCompleted).toList();

  void addTask(TaskModel taskModel) => _tasksList.add(taskModel);

  void removeTask(TaskModel taskModel) {
    logger.i('removed task: ${taskModel.description}');
    _tasksList.remove(taskModel);
    _streamController.add(TaskEvents.taskRemove);
  }

  void updateTask(TaskModel taskModel, {required TaskModel updatedTaskModel}) {
    _tasksList[_tasksList.indexWhere((element) => identical(element, taskModel))] = updatedTaskModel;
    _streamController.add(TaskEvents.taskUpdate);
  }

  void updateTaskCompletion(TaskModel taskModel, {required bool value}) {
    logger.i('${value == true ? 'checked' : 'unchecked'} ${taskModel.description}');
    updateTask(taskModel, updatedTaskModel: taskModel.copyWith(isCompleted: value));
  }
}
