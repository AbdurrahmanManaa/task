import 'package:flutter/material.dart';
import 'package:todoapptask/features/home/presentation/views/widgets/active_inactive_drawer_item.dart';
import 'package:todoapptask/models/drawer_item_model.dart';

class HomeViewDrawerItem extends StatelessWidget {
  const HomeViewDrawerItem(
      {super.key, required this.drawerItemModel, required this.isActive});

  final DrawerItemModel drawerItemModel;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? ActiveDrawerItem(drawerItemModel: drawerItemModel)
        : InActiveDrawerItem(drawerItemModel: drawerItemModel);
  }
}
