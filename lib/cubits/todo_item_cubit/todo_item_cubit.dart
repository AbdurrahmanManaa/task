import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapptask/models/todo_item.dart';

part 'todo_item_state.dart';

class TodoitemCubit extends Cubit<TodoitemState> {
  TodoitemCubit() : super(TodoitemInitial());

  final String _boxName = 'todoItems';
  final String _completedItemsBoxName = 'completedItems';

  Future<Box<TodoItemModel>> get _box async => await Hive.openBox(_boxName);
  Future<Box<TodoItemModel>> get _completedItemsBox async =>
      await Hive.openBox(_completedItemsBoxName);

  List<TodoItemModel>? items;
  List<TodoItemModel>? completedItems;

  fetchCompletedItems() async {
    var completedBox = await _completedItemsBox;
    completedItems = completedBox.values.toList();
    emit(TodoItemSuccess());
  }

  Future<void> addCompletedItem(TodoItemModel itemModel) async {
    var completedBox = await _completedItemsBox;
    await completedBox.add(itemModel);
    fetchCompletedItems();
    emit(TodoItemSuccess());
  }

  Future<void> deleteCompletedItem(int index) async {
    var completedBox = await _completedItemsBox;
    await completedBox.deleteAt(index);
    fetchCompletedItems();
    emit(TodoItemSuccess());
  }

  fetchAllItems() async {
    var box = await _box;
    items = box.values.toList();
    emit(TodoItemSuccess());
  }

  Future<void> addItem(TodoItemModel itemModel) async {
    var box = await _box;
    await box.add(itemModel);
    fetchAllItems();
    emit(TodoItemSuccess());
  }

  Future<void> deleteItem(int index) async {
    var box = await _box;
    await box.deleteAt(index);
    fetchAllItems();
    emit(TodoItemSuccess());
  }

  Future<void> updateItem(int index, TodoItemModel itemModel) async {
    var box = await _box;
    await box.putAt(index, itemModel);
    fetchAllItems();
    emit(TodoItemSuccess());
  }
}
