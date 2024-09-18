import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapptask/cubits/todo_item_cubit/todo_item_cubit.dart';
import 'package:todoapptask/models/todo_item.dart';
import 'package:todoapptask/views/add_item/widgets/custom_button.dart';
import 'package:todoapptask/views/add_item/widgets/custom_text_form_field.dart';

class EditItemViewBody extends StatefulWidget {
  const EditItemViewBody(
      {super.key, required this.todoItemModel, required this.itemIndex});

  final TodoItemModel todoItemModel;
  final int itemIndex;

  @override
  State<EditItemViewBody> createState() => _EditItemViewBodyState();
}

class _EditItemViewBodyState extends State<EditItemViewBody> {
  late TextEditingController titleController;
  late TextEditingController detailController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    detailController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    detailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 43,
          ),
          child: CustomTextField(
            controller: titleController,
            hintText: widget.todoItemModel.title,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: CustomTextField(
            controller: detailController,
            hintText: widget.todoItemModel.detail,
          ),
        ),
        const SizedBox(
          height: 54,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
          ),
          child: CustomButton(
            text: 'Edit',
            onTap: () async {
              await BlocProvider.of<TodoitemCubit>(context).updateItem(
                  widget.itemIndex,
                  TodoItemModel(
                      title: titleController.text,
                      detail: detailController.text));
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
