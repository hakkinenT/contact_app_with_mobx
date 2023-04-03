import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../../data/controllers/my_contact_controller.dart';
import '../../../data/models/my_contact.dart';

class ContactItem extends StatelessWidget {
  const ContactItem({
    super.key,
    required this.myContact,
  });

  final MyContact myContact;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return ListTile(
        leading: const Icon(
          Icons.contact_page,
          size: 30,
        ),
        title: Text(myContact.name),
        subtitle: Text(myContact.email),
        trailing: Wrap(
          children: [
            Observer(builder: (_) {
              return FavoriteButton(
                onPressed: myContact.setFavorite,
                iconData: myContact.favorite ? Icons.star : Icons.star_border,
              );
            }),
            RemoveButton(myContact: myContact)
          ],
        ),
      );
    });
  }
}

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key, this.onPressed, required this.iconData});

  final VoidCallback? onPressed;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        iconData,
        color: Colors.amber,
      ),
    );
  }
}

class RemoveButton extends StatelessWidget {
  const RemoveButton({super.key, required this.myContact});

  final MyContact myContact;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        final controller =
            Provider.of<MyContactController>(context, listen: false);

        controller.removeContact(myContact);
      },
      icon: const Icon(
        Icons.remove_circle,
      ),
    );
  }
}
