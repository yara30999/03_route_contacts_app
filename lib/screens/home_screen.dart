import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../resourses/assets_manager.dart';
import 'provider/contacts_provider.dart';
import 'widgets/custom_floating_button.dart';
import 'widgets/empty_state.dart';
import 'widgets/list_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
      body: Provider.of<ContactsProvider>(context).items.isEmpty
          ? const EmptyState()
          : const ListState(),
      floatingActionButton: const CustomFloatingButton(),
    );
  }
}
