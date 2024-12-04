import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../resourses/styles_manager.dart';

class IconTextRow extends StatelessWidget {
  final String svg, label;
  final double svgSize;
  const IconTextRow({
    super.key,
    required this.svg,
    required this.label,
    required this.svgSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          svg,
          height: svgSize,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 10),
        Flexible(
          fit: FlexFit.tight,
          child: Text(
            label,
            style: Styles.style10Regular(),
          ),
        )
      ],
    );
  }
}
