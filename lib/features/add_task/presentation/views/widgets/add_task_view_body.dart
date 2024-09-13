import 'package:flutter/material.dart';
import 'package:todoapptask/features/add_task/presentation/views/widgets/custom_button.dart';
import 'package:todoapptask/features/add_task/presentation/views/widgets/custom_text_field.dart';
import 'package:todoapptask/models/todo_item_model.dart';
import 'package:todoapptask/services/hive_service.dart';

class AddTaskViewBody extends StatefulWidget {
  const AddTaskViewBody({super.key});

  @override
  State<AddTaskViewBody> createState() => _AddTaskViewBodyState();
}

class _AddTaskViewBodyState extends State<AddTaskViewBody> {
  final HiveService hiveService = HiveService();
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

  void saveAndPop(BuildContext context) async {
    Navigator.pop(context);
    String title = titleController.text.trim();
    String detail = detailController.text.trim();
    var item = TodoItemModel(
      title: title,
      detail: detail,
    );
    await hiveService.addItem(item);
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
            hintText: 'Title',
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: CustomTextField(
            controller: detailController,
            hintText: 'Detail',
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
            text: 'ADD',
            onTap: () {
              saveAndPop(context);
            },
          ),
        ),
      ],
    );
  }
}
