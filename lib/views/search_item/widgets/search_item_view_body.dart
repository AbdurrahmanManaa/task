import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapptask/cubits/todo_item_cubit/todo_item_cubit.dart';
import 'package:todoapptask/models/todo_item.dart';
import 'package:todoapptask/views/display_item/display_item_view.dart';
import 'package:todoapptask/views/search_item/widgets/search_text_field.dart';
import 'package:todoapptask/views/search_item/widgets/search_todo_item.dart';

class SearchItemViewBody extends StatefulWidget {
  const SearchItemViewBody({super.key});

  @override
  State<SearchItemViewBody> createState() => _SearchItemViewBodyState();
}

class _SearchItemViewBodyState extends State<SearchItemViewBody> {
  late TextEditingController controller;
  List<TodoItemModel> searchResults = [];

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 7,
        vertical: 22,
      ),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SearchTextField(
              controller: controller,
              onSubmitted: (query) {
                setState(() {
                  query = controller.text;
                  searchResults = BlocProvider.of<TodoitemCubit>(context)
                      .items!
                      .where(
                        (element) => element.title.toLowerCase().contains(
                              query.toLowerCase(),
                            ),
                      )
                      .toList();
                });
              },
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 30),
          ),
          SliverList.builder(
            itemCount: searchResults.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                  bottom: 21,
                ),
                child: SearchTodoItem(
                  todoItemModel: searchResults[index],
                  onDisplay: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return DisplayItemView(
                            todoItemModel: searchResults[index],
                          );
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
  }
}
