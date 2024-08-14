import 'package:flutter/material.dart';
import 'package:fruit/core/Utils/assets.dart';
import 'package:svg_flutter/svg.dart';

class OnBoardingPageViewBody extends StatelessWidget {
  const OnBoardingPageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: const [
        PageViewItem(
          background: Assets.imagesBackgroundOrange,
          title: Row(
            children: [
              Text("مرحبا بك في"),
              Text("Fruit", style: TextStyle(color: Colors.orange)),
              Text("HUB", style: TextStyle(color: Colors.orange)),
            ],
          ),
          subtitle:
              "اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.",
          image: Assets.imagesFruitInbording2,
        ),
      ],
    );
  }
}

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key,
      required this.image,
      required this.background,
      required this.title,
      required this.subtitle});
  final String image, background;
  final Widget title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                  child: SvgPicture.asset(
                background,
                fit: BoxFit.fill,
              )),
              Positioned(
                  bottom: 0, left: 0, right: 0, child: SvgPicture.asset(image)),
              const Text('تخط'),
            ],
          ),
        ),
        title,
        Text(subtitle),
      ],
    );
  }
}
