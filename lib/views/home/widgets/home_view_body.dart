import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapptask/cubits/todo_item_cubit/todo_item_cubit.dart';
import 'package:todoapptask/views/display_item/display_item_view.dart';
import 'package:todoapptask/views/edit_item/edit_item_view.dart';
import 'package:todoapptask/views/home/widgets/todo_item.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TodoitemCubit>(context).fetchAllItems();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoitemCubit, TodoitemState>(
      builder: (context, state) {
        var items = context.read<TodoitemCubit>().items ?? [];

        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 7,
            vertical: 22,
          ),
          child: CustomScrollView(
            slivers: [
              SliverList.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      bottom: 21,
                    ),
                    child: TodoItem(
                      todoItemModel: items[index],
                      onDisplay: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return DisplayItemView(
                                todoItemModel: items[index],
                              );
                            },
                          ),
                        );
                      },
                      onDelete: () {
                        BlocProvider.of<TodoitemCubit>(context)
                            .deleteItem(index);
                      },
                      onComplete: () {
                        BlocProvider.of<TodoitemCubit>(context)
                            .deleteItem(index);
                        BlocProvider.of<TodoitemCubit>(context)
                            .addCompletedItem(items[index]);
                      },
                      onEdit: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return EditItemView(
                                  todoItemModel: items[index],
                                  itemIndex: index);
                            },
                          ),
                        );
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
