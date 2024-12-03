import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resourses/assets_manager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SvgPicture.asset(SvgAssets.routeIcon)),
    );
  }
}
