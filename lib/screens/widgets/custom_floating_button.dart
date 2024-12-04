import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/user_model.dart';
import '../../resourses/colors_manager.dart';
import '../provider/contacts_provider.dart';
import 'add_user_bottom_sheet.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({super.key});

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
        Provider.of<ContactsProvider>(context, listen: false).addUser(result);
      }
    }
  }

  Future<void> _deleteLastUser(BuildContext context) async {
    if (context.mounted) {
      Provider.of<ContactsProvider>(context, listen: false).deleteLast();
    }
  }

  @override
  Widget build(BuildContext context) {
    var items = Provider.of<ContactsProvider>(context).items;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Visibility(
          visible: items.isEmpty ? false : true,
          child: FloatingActionButton(
            heroTag: 'fab1',
            backgroundColor: ColorsManager.red,
            child: const Icon(
              Icons.delete,
              color: ColorsManager.gold,
            ),
            onPressed: () async {
              _deleteLastUser(context);
            },
          ),
        ),
        const SizedBox(height: 8),
        Visibility(
          visible: items.length == 6 ? false : true,
          child: FloatingActionButton(
            heroTag: 'fab2',
            child: const Icon(Icons.add),
            onPressed: () async {
              _addUserBottomSheet(context);
            },
          ),
        ),
      ],
    );
  }
}
