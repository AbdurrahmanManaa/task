import 'package:flutter/material.dart';

class DisplayItemViewBody extends StatelessWidget {
  const DisplayItemViewBody({super.key, required this.detail});

  final String detail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 22,
      ),
      child: Column(
        children: [
          Text(
            detail,
            style: const TextStyle(
              fontSize: 24,
              fontFamily: 'Jost',
            ),
          ),
        ],
      ),
    );
  }
}
