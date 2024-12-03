import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../resourses/assets_manager.dart';
import '../../resourses/styles_manager.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        LottieBuilder.asset(
          JsonAssets.empty1,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Text(
          'There is No Contacts Added Here',
          style: Styles.style20Bold(),
        ),
      ],
    );
  }
}
