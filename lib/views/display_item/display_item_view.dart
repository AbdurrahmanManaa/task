import 'package:flutter/material.dart';
import 'package:todoapptask/models/todo_item.dart';
import 'package:todoapptask/views/display_item/widgets/display_item_view_body.dart';

class DisplayItemView extends StatelessWidget {
  const DisplayItemView({super.key, required this.todoItemModel});

  final TodoItemModel todoItemModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF9395D3),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 32,
          ),
        ),
        title: Text(
          todoItemModel.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: 'Jost',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: DisplayItemViewBody(
        detail: todoItemModel.detail,
      ),
    );
  }
}
