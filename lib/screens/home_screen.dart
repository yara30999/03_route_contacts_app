import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../models/user_model.dart';
import '../resourses/assets_manager.dart';
import '../resourses/colors_manager.dart';
import '../resourses/styles_manager.dart';
import 'provider/contacts_list.dart';
import 'widgets/add_user_bottom_sheet.dart';
import 'widgets/empty_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _addUser(BuildContext context) async {
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
          _addUser(context);
        },
      ),
    );
  }
}

class ListState extends StatelessWidget {
  const ListState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        children: List.generate(
            Provider.of<ContactsListProvider>(context).items.length, (index) {
          return ContactCard(
            userModer: Provider.of<ContactsListProvider>(context).items[index],
          );
        }),
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  final UserModel userModer;
  const ContactCard({
    super.key,
    required this.userModer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      height: 280,
      width: 175,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ColorsManager.gold,
      ),
      child: Column(
        children: [
          Expanded(
            flex: 10,
            child: ImageWithBottomLeftName(userModer: userModer),
          ),
          Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconTextRow(
                      svg: SvgAssets.mailIcon,
                      label: userModer.email,
                      svgSize: 20,
                    ),
                    IconTextRow(
                      svg: SvgAssets.phoneIcon,
                      label: userModer.number,
                      svgSize: 25,
                    ),
                    RedDeleteButton(
                      onDelete: () {
                        Provider.of<ContactsListProvider>(context,
                                listen: false)
                            .deleteUser(userModer);
                      },
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

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
