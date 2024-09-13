import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapptask/features/home/presentation/views/home_view.dart';
import 'package:todoapptask/models/todo_item_model.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(
    TodoItemModelAdapter(),
  );

  runApp(
    const ToDoApp(),
  );
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
