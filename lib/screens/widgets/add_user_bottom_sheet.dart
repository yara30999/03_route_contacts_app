import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import '../../models/user_moder.dart';
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
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  File? _image;

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void enterUser() {
    UserModer userModer = UserModer(
        name: _controller1.text.trim(),
        email: _controller1.text.trim(),
        number: _controller1.text.trim(),
        img: _image);
    Navigator.pop(context, userModer);
  }

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
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  _pickImage();
                },
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: ColorsManager.gold,
                      width: 2,
                    ),
                  ),
                  child: _image == null
                      ? LottieBuilder.asset(
                          JsonAssets.imagePicker,
                          fit: BoxFit.cover,
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Image.file(
                            _image!,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _controller1.text.isEmpty ? 'User Name' : _controller1.text,
                    style: Styles.style16Medium(),
                  ),
                  const CustomDivider(),
                  Text(
                    _controller2.text.isEmpty
                        ? 'example@email.com'
                        : _controller2.text,
                    style: Styles.style16Medium(),
                  ),
                  const CustomDivider(),
                  Text(
                    _controller3.text.isEmpty
                        ? '+200000000000'
                        : _controller3.text,
                    style: Styles.style16Medium(),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _controller1,
            decoration: const InputDecoration(
              labelText: "Enter User Name ",
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _controller2,
            decoration: const InputDecoration(
              labelText: "Enter User Email ",
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _controller3,
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
                enterUser();
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
