import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../resourses/assets_manager.dart';
import '../resourses/colors_manager.dart';
import 'widgets/add_user_bottom_sheet.dart';
import 'widgets/empty_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<String?> _addUser(BuildContext context) {
    return showModalBottomSheet<String>(
      backgroundColor: ColorsManager.darkBlue,
      barrierColor: ColorsManager.black.withOpacity(0.7),
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return const AddUserBottomSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 40,
          width: 120,
          child: SvgPicture.asset(SvgAssets.routeIcon),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: EmptyState(),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          _addUser(context);
        },
      ),
    );
  }
}
