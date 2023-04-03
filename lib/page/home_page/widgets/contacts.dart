import 'package:flutter/material.dart';

import '../../../data/models/my_contact.dart';
import 'contact_item.dart';

class Contacts extends StatelessWidget {
  const Contacts({super.key, required this.contacts});

  final List<MyContact> contacts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        return ContactItem(
          myContact: contacts[index],
        );
      },
    );
  }
}
