import 'package:flutter/material.dart';
import '../../resourses/colors_manager.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 1,
      margin: const EdgeInsets.only(top: 16.0, bottom: 16.0),
      color: ColorsManager.gold,
    );
  }
}
