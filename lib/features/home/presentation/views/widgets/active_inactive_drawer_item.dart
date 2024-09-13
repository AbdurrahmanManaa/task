import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todoapptask/models/drawer_item_model.dart';

class ActiveDrawerItem extends StatelessWidget {
  const ActiveDrawerItem({super.key, required this.drawerItemModel});

  final DrawerItemModel drawerItemModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        drawerItemModel.icon,
        colorFilter: const ColorFilter.mode(Color(0xFF9395D3), BlendMode.srcIn),
      ),
      title: Text(
        drawerItemModel.title,
        style: const TextStyle(
          color: Color(0xFF9395D3),
          fontSize: 24,
          fontFamily: 'Jost',
        ),
      ),
    );
  }
}

class InActiveDrawerItem extends StatelessWidget {
  const InActiveDrawerItem({super.key, required this.drawerItemModel});

  final DrawerItemModel drawerItemModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        drawerItemModel.icon,
        colorFilter: const ColorFilter.mode(Color(0xFF8B8787), BlendMode.srcIn),
      ),
      title: Text(
        drawerItemModel.title,
        style: const TextStyle(
          color: Color(0xFF8B8787),
          fontSize: 24,
          fontFamily: 'Jost',
        ),
      ),
    );
  }
}
