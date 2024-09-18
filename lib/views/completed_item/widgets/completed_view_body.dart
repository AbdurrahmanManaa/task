import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapptask/cubits/todo_item_cubit/todo_item_cubit.dart';
import 'package:todoapptask/views/completed_item/widgets/completed_todo_item.dart';
import 'package:todoapptask/views/display_item/display_item_view.dart';

class CompletedViewBody extends StatefulWidget {
  const CompletedViewBody({super.key});

  @override
  State<CompletedViewBody> createState() => _CompletedViewBodyState();
}

class _CompletedViewBodyState extends State<CompletedViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TodoitemCubit>(context).fetchCompletedItems();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoitemCubit, TodoitemState>(
      builder: (context, state) {
        var completedItems = context.read<TodoitemCubit>().completedItems ?? [];

        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 7,
            vertical: 22,
          ),
          child: CustomScrollView(
            slivers: [
              SliverList.builder(
                itemCount: completedItems.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      bottom: 21,
                    ),
                    child: CompletedTodoItem(
                      todoItemModel: completedItems[index],
                      onDisplay: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return DisplayItemView(
                                todoItemModel: completedItems[index],
                              );
                            },
                          ),
                        );
                      },
                      onUnCompleted: () {
                        BlocProvider.of<TodoitemCubit>(context)
                            .deleteCompletedItem(index);
                        BlocProvider.of<TodoitemCubit>(context)
                            .addItem(completedItems[index]);
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
