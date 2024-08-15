import 'package:flutter/material.dart';
import 'package:fruit/core/Utils/app_colors.dart';
import 'package:fruit/core/Utils/app_style.dart';
import 'package:fruit/core/Utils/assets.dart';

import 'page_view_item.dart';

class OnBoardingPageViewBody extends StatelessWidget {
  const OnBoardingPageViewBody({super.key, this.controller});
  final PageController? controller;
  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const BouncingScrollPhysics(),
      controller: controller,
      children: [
        PageViewItem(
          visibleButton: false,
          visibleSkip: true,
          background: Assets.imagesBackgroundOrange,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("مرحبا بك في", style: AppStyle.heading23Bold),
              Text(" HUB",
                  style: AppStyle.heading23Bold
                      .copyWith(color: AppColors.secondary)),
              Text("Fruit",
                  style: AppStyle.heading23Bold
                      .copyWith(color: AppColors.primary)),
            ],
          ),
          subtitle:
              "اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.",
          image: Assets.imagesFruitInbording2,
        ),
        const PageViewItem(
          visibleButton: true,
          visibleSkip: false,
          background: Assets.imagesBackgroundGreen,
          title: Text("ابحث وتسوق"),
          subtitle:
              "نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية",
          image: Assets.imagesPineapple,
        ),
      ],
    );
  }
}
