import 'package:flutter/material.dart';
import 'package:todoapptask/views/search_item/widgets/search_item_view_body.dart';

class SearchItemView extends StatelessWidget {
  const SearchItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 32,
          ),
        ),
        backgroundColor: const Color(0xFF9395D3),
        title: const Text(
          'Search Task',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: 'Jost',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: const SearchItemViewBody(),
    );
  }
}
