import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class InActiveItem extends StatelessWidget {
  const InActiveItem({super.key, required this.assetName});
  final String assetName;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(assetName);
  }
}
