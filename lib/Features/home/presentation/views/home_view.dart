import 'package:flutter/material.dart';
import 'package:fruit/Features/home/domin/entites/bottom_navagition_bar_entity.dart';
import 'package:fruit/Features/home/presentation/views/widgets/active_item.dart';
import 'package:fruit/Features/home/presentation/views/widgets/custom_bottom_nav_bar.dart';
import 'package:fruit/Features/home/presentation/views/widgets/home_view_body.dart';
import 'package:fruit/Features/home/presentation/views/widgets/navigation_bar_item.dart';
import 'package:fruit/core/Utils/assets.dart';
import 'package:svg_flutter/svg.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: CustomBottomNavBar(),
      body: SafeArea(child: HomeViewBody()),
    );
  }
}
