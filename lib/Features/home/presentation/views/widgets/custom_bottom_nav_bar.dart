import 'package:flutter/material.dart';
import 'package:fruit/Features/home/domin/entites/bottom_navagition_bar_entity.dart';
import 'package:fruit/Features/home/presentation/views/widgets/navigation_bar_item.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 70,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 25,
            offset: Offset(0, -2),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
          children: bottomNavigationBarList.asMap().entries.map(
        (e) {
          int key = e.key;
          var item = e.value;
          return Expanded(
            flex: currentIndex == key ? 3 : 2,
            child: InkWell(
              onTap: () {
                setState(() {
                  currentIndex = key;
                });
              },
              child: NavigationBarItem(
                isActive: key == currentIndex,
                item: item,
              ),
            ),
          );
        },
      ).toList()),
    );
  }
}
