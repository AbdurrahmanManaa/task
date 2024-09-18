import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigationItem extends StatelessWidget {
  const BottomNavigationItem(
      {super.key, required this.title, required this.icon, this.onTap});

  final String title, icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SvgPicture.asset(
            icon,
            colorFilter:
                const ColorFilter.mode(Color(0xFF9395D3), BlendMode.srcIn),
          ),
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF9395D3),
              fontSize: 14,
              fontFamily: 'Jost',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
