import 'package:flutter/material.dart';
import 'package:todoapptask/views/completed_item/completed_view.dart';
import 'package:todoapptask/views/home/widgets/bottom_navigation_item.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12),
      height: 75,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const BottomNavigationItem(
                title: 'All',
                icon: 'assets/images/Playlist.svg',
              ),
              BottomNavigationItem(
                title: 'Completed',
                icon: 'assets/images/Tick.svg',
                onTap: () {
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
            ],
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
