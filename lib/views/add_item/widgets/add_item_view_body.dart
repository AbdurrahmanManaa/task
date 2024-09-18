import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapptask/cubits/todo_item_cubit/todo_item_cubit.dart';
import 'package:todoapptask/models/todo_item.dart';
import 'package:todoapptask/views/add_item/widgets/custom_button.dart';
import 'package:todoapptask/views/add_item/widgets/custom_text_form_field.dart';

class AddItemViewBody extends StatefulWidget {
  const AddItemViewBody({super.key});

  @override
  State<AddItemViewBody> createState() => _AddItemViewBodyState();
}

class _AddItemViewBodyState extends State<AddItemViewBody> {
  late TextEditingController titleController;
  late TextEditingController detailController;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey();

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
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
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
              onTap: () async {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  String title = titleController.text.trim();
                  String detail = detailController.text.trim();

                  await BlocProvider.of<TodoitemCubit>(context).addItem(
                    TodoItemModel(
                      title: title,
                      detail: detail,
                    ),
                  );
                  Navigator.pop(context);
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
