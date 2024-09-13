import 'package:hive_flutter/hive_flutter.dart';
part 'todo_item_model.g.dart';

@HiveType(typeId: 0)
class TodoItemModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String detail;
  @HiveField(2)
  bool isCompleted;

  TodoItemModel(
      {required this.title, required this.detail, this.isCompleted = false});
}
