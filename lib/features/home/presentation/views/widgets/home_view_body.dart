import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapptask/features/completed_tasks/presentation/views/completed_view.dart';
import 'package:todoapptask/features/display_item/presentation/views/display_item_view.dart';
import 'package:todoapptask/features/home/presentation/views/widgets/todo_item.dart';
import 'package:todoapptask/models/todo_item_model.dart';
import 'package:todoapptask/services/hive_service.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  final HiveService hiveService = HiveService();
  Future<void> openBox() async {
    await Hive.openBox<TodoItemModel>('todoItems');
  }

  @override
  void initState() {
    super.initState();
    openBox();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: hiveService.getAllItems(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ValueListenableBuilder(
            valueListenable: Hive.box<TodoItemModel>('todoItems').listenable(),
            builder: (context, box, _) {
              if (box.values.isEmpty) {
                return const Center(
                  child: Text(
                    'No Items Found',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Jost',
                    ),
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 7,
                  vertical: 22,
                ),
                child: CustomScrollView(
                  slivers: [
                    SliverList.builder(
                      itemCount: box.values.length,
                      itemBuilder: (context, index) {
                        var item = box.getAt(index);
                        return Padding(
                          padding: const EdgeInsets.only(
                            bottom: 21,
                          ),
                          child: TodoItem(
                            todoItemModel: item!,
                            onDisplay: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return DisplayItemView(
                                      title: item.title,
                                      detail: item.detail,
                                    );
                                  },
                                ),
                              );
                            },
                            onDelete: () {
                              hiveService.deleteItem(index);
                            },
                            onComplete: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const CompletedView();
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
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
