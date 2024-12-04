import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/user_model.dart';
import '../../resourses/assets_manager.dart';
import '../../resourses/colors_manager.dart';
import '../provider/contacts_list.dart';
import 'icon_text_row.dart';
import 'image_with_bottom_left_name.dart';
import 'red_delete_button.dart';

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
