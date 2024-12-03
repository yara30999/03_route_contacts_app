import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/user_moder.dart';
import '../resourses/assets_manager.dart';
import '../resourses/colors_manager.dart';
import 'widgets/add_user_bottom_sheet.dart';
import 'widgets/empty_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<UserModer> items = [];

  Future<void> _addUser(BuildContext context) async {
    final result = await showModalBottomSheet<UserModer?>(
      context: context,
      backgroundColor: ColorsManager.darkBlue,
      barrierColor: ColorsManager.black.withOpacity(0.8),
      isScrollControlled: true,
      builder: (context) {
        return const AddUserBottomSheet();
      },
    );

    if (result != null) {
      setState(() {
        items.add(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: SizedBox(
          height: 40,
          width: 120,
          child: SvgPicture.asset(SvgAssets.routeIcon),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: items.isNotEmpty
            ? const Expanded(
                child: Center(child: Text("you added some items :) ")),
              )
            : const EmptyState(),
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
