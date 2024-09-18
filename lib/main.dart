import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapptask/cubits/todo_item_cubit/todo_item_cubit.dart';
import 'package:todoapptask/views/home/home_view.dart';
import 'package:todoapptask/models/todo_item.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TodoItemModelAdapter());
  await Hive.openBox<TodoItemModel>('todoItems');
  await Hive.openBox<TodoItemModel>('completedItems');

  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoitemCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeView(),
      ),
    );
  }
}
