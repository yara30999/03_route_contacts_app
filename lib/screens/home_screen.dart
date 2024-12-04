import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../models/user_model.dart';
import '../resourses/assets_manager.dart';
import '../resourses/colors_manager.dart';
import 'provider/contacts_list.dart';
import 'widgets/add_user_bottom_sheet.dart';
import 'widgets/empty_state.dart';
import 'widgets/list_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _addUserBottomSheet(BuildContext context) async {
    final result = await showModalBottomSheet<UserModel?>(
      context: context,
      backgroundColor: ColorsManager.darkBlue,
      barrierColor: ColorsManager.black.withOpacity(0.8),
      isScrollControlled: true,
      builder: (context) {
        return const AddUserBottomSheet();
      },
    );

    if (result != null) {
      if (context.mounted) {
        Provider.of<ContactsListProvider>(context, listen: false)
            .addUser(result);
      }
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
      body: Provider.of<ContactsListProvider>(context).items.isEmpty
          ? const EmptyState()
          : const ListState(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          _addUserBottomSheet(context);
        },
      ),
    );
  }
}
