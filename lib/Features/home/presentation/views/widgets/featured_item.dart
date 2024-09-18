import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;
import 'package:fruit/Features/home/presentation/views/widgets/featured_item_button.dart';
import 'package:fruit/core/Utils/app_style.dart';
import 'package:fruit/core/Utils/assets.dart';
import 'package:svg_flutter/svg.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});
  @override
  Widget build(BuildContext context) {
  var width = MediaQuery.sizeOf(context).width - 32;
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: SizedBox(
        width: width,
        child: AspectRatio(
          aspectRatio: 342 / 158,
          child: Stack(
            children: [
              Positioned.fill(
                  left: 0,
                  right: width * .36,
                  bottom: 0,
                  child: SvgPicture.asset(Assets.imagesFruitInbording2)),
              Container(
                width: width / 2,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: svg.Svg(Assets.imagesFeatureItemBackground))),
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 25),
                      Opacity(
                        opacity: 0.80,
                        child: Text('عروض العيد',
                            style: AppStyle.body13Regular
                                .copyWith(color: Colors.white)),
                      ),
                      const Spacer(),
                      Text('خصم 25%',
                          style: AppStyle.body19Bold
                              .copyWith(color: Colors.white)),
                      const SizedBox(height: 11),
                      FeaturedItemButton(onPressed: () {}),
                      const SizedBox(height: 29),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
