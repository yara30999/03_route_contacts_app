import 'package:flutter/material.dart';
import '../../models/user_model.dart';
import '../../resourses/colors_manager.dart';
import '../../resourses/styles_manager.dart';

class ImageWithBottomLeftName extends StatelessWidget {
  const ImageWithBottomLeftName({
    super.key,
    required this.userModer,
  });

  final UserModel userModer;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: Image.file(
            userModer.img!,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: ColorsManager.gold,
            ),
            child: Text(
              userModer.name,
              style: Styles.style14Medium(),
            ),
          ),
        )
      ],
    );
  }
}
