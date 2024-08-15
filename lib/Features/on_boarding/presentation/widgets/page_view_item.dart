import 'package:flutter/material.dart';
import 'package:fruit/constants.dart';
import 'package:fruit/core/Utils/app_router.dart';
import 'package:fruit/core/Utils/app_style.dart';
import 'package:fruit/core/services/shared_preference_singletone.dart';
import 'package:svg_flutter/svg.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key,
      required this.image,
      required this.background,
      required this.title,
      required this.subtitle,
      required this.visibleButton,
      required this.visibleSkip});
  final String image, background;
  final Widget title;
  final String subtitle;
  final bool visibleButton;
  final bool visibleSkip;
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
              Visibility(
                visible: visibleSkip,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: GestureDetector(
                    onTap: () {
                      SharedPreferenceSingleton.setBool(
                          kOnBoardingVisited, true);
                      Navigator.of(context)
                          .pushReplacementNamed(AppRouter.login);
                    },
                    child: Text(
                      'تخط',
                      style: AppStyle.body13Regular.copyWith(
                        color: const Color(0xFF949D9E),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 64),
        title,
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: AppStyle.body13Semibold.copyWith(
              color: const Color(0xFF4E5556),
            ),
          ),
        ),
      ],
    );
  }
}
