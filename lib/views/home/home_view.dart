import 'package:flutter/material.dart';
import 'package:todoapptask/views/home/widgets/custom_bottom_navigation_bar.dart';
import 'package:todoapptask/views/home/widgets/home_view_body.dart';
import 'package:todoapptask/views/home/widgets/home_view_floating_action_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigationBar(),
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
