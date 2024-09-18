import 'package:hive/hive.dart';

part 'todo_item.g.dart';

@HiveType(typeId: 0)
class TodoItemModel {
  @HiveField(0)
  String title;
  @HiveField(1)
  String detail;
  @HiveField(2, defaultValue: false)
  bool? isCompleted;

  TodoItemModel({required this.title, required this.detail, this.isCompleted});
}
