import 'package:flutter/material.dart';
import 'package:todoapptask/views/add_item/widgets/add_item_view_body.dart';

class AddItemView extends StatelessWidget {
  const AddItemView({super.key});

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
          'Add Task',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: 'Jost',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: const AddItemViewBody(),
    );
  }
}
