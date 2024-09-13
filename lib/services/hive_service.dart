import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapptask/models/todo_item_model.dart';

class HiveService {
  final String _boxName = 'todoItems';

  Future<Box<TodoItemModel>> get _box async => await Hive.openBox(_boxName);

  Future<void> addItem(TodoItemModel itemModel) async {
    var box = await _box;
    await box.add(itemModel);
  }

  Future<List<TodoItemModel>> getAllItems() async {
    var box = await _box;
    return box.values.toList();
  }

  Future<void> deleteItem(int index) async {
    var box = await _box;
    await box.deleteAt(index);
  }
}
