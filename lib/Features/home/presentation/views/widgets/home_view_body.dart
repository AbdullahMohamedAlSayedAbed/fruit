import 'package:flutter/material.dart';
import 'package:fruit/Features/home/presentation/views/widgets/best_selling_grid_view.dart';
import 'package:fruit/Features/home/presentation/views/widgets/best_selling_header.dart';
import 'package:fruit/Features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:fruit/Features/home/presentation/views/widgets/featured_item_list.dart';
import 'package:fruit/constants.dart';

import 'package:fruit/core/Utils/assets.dart';
import 'package:fruit/core/widgets/search_text_field.dart';
import 'package:svg_flutter/svg.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: Column(
              children: [
                const SizedBox(height: kTopPadding),
                const CustomHomeAppBar(),
                const SizedBox(height: kTopPadding),
                SearchTextField(
                  hintText: "ابحث عن.......",
                  suffixIcon: SizedBox(
                      width: 20,
                      child: Center(
                          child: SvgPicture.asset(Assets.imagesSearchFilter))),
                ),
                const SizedBox(height: 12),
                const FeaturedItemList(),
                const SizedBox(height: 12),
                const BestSellingHeader(),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
                const BestSellingGridView(),
      ],
    );
  }
}
