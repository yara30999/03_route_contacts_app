import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/contacts_provider.dart';
import 'contact_card.dart';

class ListState extends StatelessWidget {
  const ListState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        children: List.generate(
            Provider.of<ContactsProvider>(context).items.length, (index) {
          return ContactCard(
            userModer: Provider.of<ContactsProvider>(context).items[index],
          );
        }),
      ),
    );
  }
}
