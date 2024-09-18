import 'package:fruit/core/Utils/assets.dart';

class BottomNavigationBarEntity {
  String activeImage;
  String inActiveImage;
  String title;
  BottomNavigationBarEntity(
      {required this.activeImage,
      required this.inActiveImage,
      required this.title});
}

List<BottomNavigationBarEntity> get bottomNavigationBarList => [
  BottomNavigationBarEntity(
      activeImage: Assets.imagesHomeSolid,
      inActiveImage: Assets.imagesHomeOutline,
      title: 'الرئيسية'),
  BottomNavigationBarEntity(
      activeImage: Assets.imagesElement3Solid,
      inActiveImage: Assets.imagesElement3Outline,
      title: 'المنتجات'),
  BottomNavigationBarEntity(
      activeImage: Assets.imagesShoppingCartSolid,
      inActiveImage: Assets.imagesShoppingCartOutline,
      title: 'سلة التسوق'),
  BottomNavigationBarEntity(
      activeImage: Assets.imagesUserSolid,
      inActiveImage: Assets.imagesUserOutline,
      title: 'حسابي'),
];
