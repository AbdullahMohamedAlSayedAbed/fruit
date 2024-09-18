import 'package:flutter/material.dart';
import 'package:fruit/Features/home/domin/entites/bottom_navagition_bar_entity.dart';
import 'package:fruit/Features/home/presentation/views/widgets/active_item.dart';
import 'package:fruit/Features/home/presentation/views/widgets/in_active_item.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem(
      {super.key, required this.isActive, required this.item});
  final bool isActive;
  final BottomNavigationBarEntity item;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: isActive
          ? ActiveItem(
              text: item.title,
              assetName: item.activeImage,
            )
          : InActiveItem(
              assetName: item.inActiveImage,
            ),
    );
  }
}
