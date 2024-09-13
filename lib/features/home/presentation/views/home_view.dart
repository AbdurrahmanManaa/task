import 'package:flutter/material.dart';
import 'package:todoapptask/features/home/presentation/views/widgets/drawer_items_list.dart';
import 'package:todoapptask/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:todoapptask/features/home/presentation/views/widgets/home_view_floating_action_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            DrawerItemsList(),
          ],
        ),
      ),
      backgroundColor: const Color(0xffd6d7ef),
      appBar: AppBar(
        backgroundColor: const Color(0xFF9395D3),
        title: const Text(
          'TODO APP',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: 'Jost',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      floatingActionButton: const HomeViewFloatingActionButton(),
      body: const HomeViewBody(),
    );
  }
}
