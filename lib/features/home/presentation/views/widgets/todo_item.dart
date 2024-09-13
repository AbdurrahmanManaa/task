import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todoapptask/models/todo_item_model.dart';

class TodoItem extends StatelessWidget {
  const TodoItem(
      {super.key,
      required this.todoItemModel,
      this.onDelete,
      this.onComplete,
      this.onDisplay});
  final TodoItemModel todoItemModel;
  final void Function()? onDelete;
  final void Function()? onComplete;
  final void Function()? onDisplay;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onDisplay,
      child: Container(
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 19,
            vertical: 12,
          ),
          title: Text(
            todoItemModel.title,
            style: const TextStyle(
              color: Color(0xFF9395D3),
              fontSize: 20,
              fontFamily: 'Jost',
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            todoItemModel.detail,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: 'Jost',
              fontWeight: FontWeight.w400,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: onDelete,
                icon: SvgPicture.asset(
                  'assets/images/Trash.svg',
                ),
              ),
              IconButton(
                onPressed: onComplete,
                icon: SvgPicture.asset('assets/images/CheckCircle.svg'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
