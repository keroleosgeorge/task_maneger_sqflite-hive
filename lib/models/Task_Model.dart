import 'package:hive/hive.dart';

part 'Task_Model.g.dart';

@HiveType(typeId: 0)
class TaskModel {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String content;

  TaskModel({
    required this.title,
    required this.content,
  });
}
