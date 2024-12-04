import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../resourses/assets_manager.dart';
import '../../resourses/colors_manager.dart';
import '../../resourses/styles_manager.dart';

class RedDeleteButton extends StatelessWidget {
  final VoidCallback onDelete;
  const RedDeleteButton({
    super.key,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 30,
      child: ElevatedButton(
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            backgroundColor: const WidgetStatePropertyAll(ColorsManager.red),
          ),
          onPressed: onDelete,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                SvgAssets.deleteIcon,
                width: 12,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 10),
              Text(
                'Delete',
                style: Styles.style10Regular()
                    .copyWith(color: ColorsManager.white),
              )
            ],
          )),
    );
  }
}
