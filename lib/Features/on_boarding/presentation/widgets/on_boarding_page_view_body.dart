import 'package:flutter/material.dart';
import 'package:fruit/core/Utils/assets.dart';
import 'package:svg_flutter/svg.dart';

import 'page_view_item.dart';

class OnBoardingPageViewBody extends StatelessWidget {
  const OnBoardingPageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const BouncingScrollPhysics(),
      children: const [
        PageViewItem(
          background: Assets.imagesBackgroundOrange,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("مرحبا بك في"),
              Text(" HUB", style: TextStyle(color: Colors.orange)),
              Text("Fruit", style: TextStyle(color: Colors.orange)),
            ],
          ),
          subtitle:
              "اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.",
          image: Assets.imagesFruitInbording2,
        ),
        PageViewItem(
          background: Assets.imagesBackgroundOrange,
          title: Text("ابحث وتسوق"),
          subtitle:
              "نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية",
          image: Assets.imagesPineapple,
        ),
      ],
    );
  }
}
