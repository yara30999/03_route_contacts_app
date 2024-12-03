import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../resourses/assets_manager.dart';
import '../../resourses/colors_manager.dart';
import '../../resourses/styles_manager.dart';
import 'custom_divider.dart';

class AddUserBottomSheet extends StatefulWidget {
  const AddUserBottomSheet({super.key});

  @override
  State<AddUserBottomSheet> createState() => _AddUserBottomSheetState();
}

class _AddUserBottomSheetState extends State<AddUserBottomSheet> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 16.0,
          left: 16.0,
          right: 16.0,
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const InfoDisplay(),
          const SizedBox(height: 16),
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              labelText: "Enter User Name ",
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              labelText: "Enter User Email ",
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              labelText: "Enter User phone ",
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context, _controller.text.trim());
              },
              child: const Text("Enter user"),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class InfoDisplay extends StatelessWidget {
  const InfoDisplay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: ColorsManager.gold,
              width: 2,
            ),
          ),
          child: LottieBuilder.asset(JsonAssets.imagePicker),
        ),
        const SizedBox(width: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'User Name',
              style: Styles.style16Medium(),
            ),
            const CustomDivider(),
            Text(
              'example@email.com',
              style: Styles.style16Medium(),
            ),
            const CustomDivider(),
            Text(
              '+200000000000',
              style: Styles.style16Medium(),
            ),
          ],
        )
      ],
    );
  }
}
