import 'package:flutter/material.dart';
import 'package:todoapptask/models/todo_item.dart';
import 'package:todoapptask/views/edit_item/widgets/edit_item_view_body.dart';

class EditItemView extends StatelessWidget {
  const EditItemView(
      {super.key, required this.todoItemModel, required this.itemIndex});

  final TodoItemModel todoItemModel;
  final int itemIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
        backgroundColor: const Color(0xFF9395D3),
        title: const Text(
          'Edit Task',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: 'Jost',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: EditItemViewBody(
        todoItemModel: todoItemModel,
        itemIndex: itemIndex,
      ),
    );
  }
}
