// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:todoapptask/features/completed_tasks/presentation/views/completed_view.dart';
import 'package:todoapptask/features/home/presentation/views/home_view.dart';
import 'package:todoapptask/features/home/presentation/views/widgets/home_view_drawer_item.dart';
import 'package:todoapptask/models/drawer_item_model.dart';

class DrawerItemsList extends StatefulWidget {
  const DrawerItemsList({super.key});

  @override
  State<DrawerItemsList> createState() => _DrawerItemsListState();
}

class _DrawerItemsListState extends State<DrawerItemsList> {
  int activeIndex = 0;
  List<DrawerItemModel> items = [
    DrawerItemModel(title: 'All', icon: 'assets/images/Playlist.svg'),
    DrawerItemModel(title: 'Completed', icon: 'assets/images/Tick.svg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        2,
        (index) => GestureDetector(
          onTap: () {
            if (activeIndex != index) {
              setState(() {
                activeIndex = index;
              });
            }
            Future.delayed(
              const Duration(milliseconds: 100),
              () {
                Navigator.pop(context);
                if (index == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const HomeView();
                      },
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const CompletedView();
                      },
                    ),
                  );
                }
              },
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: HomeViewDrawerItem(
                drawerItemModel: items[index], isActive: activeIndex == index),
          ),
        ),
      ),
    );
  }
}
