import 'package:flutter/material.dart';
import 'package:todoapptask/features/add_task/presentation/views/add_task_view.dart';

class HomeViewFloatingActionButton extends StatelessWidget {
  const HomeViewFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return const AddTaskView();
          }),
        );
      },
      child: Container(
        width: 70,
        height: 70,
        decoration: const ShapeDecoration(
          color: Color(0xFF9395D3),
          shape: OvalBorder(),
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
