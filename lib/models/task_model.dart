import 'package:the_forget_me_not_list/feature/main_screen/presentation/widgets/list_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_model.freezed.dart';

@freezed
class TaskModel with _$TaskModel {
  factory TaskModel({
    required bool isCompleted,
    required String description,
    required Importance importance,
    DateTime? dueDate,
  }) = _TaskModel;
}
