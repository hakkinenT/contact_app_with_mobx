// ignore_for_file: library_private_types_in_public_api

import 'package:flutter_contact_app_with_mobx/data/models/my_contact.dart';
import 'package:mobx/mobx.dart';
part 'my_contact_controller.g.dart';

class MyContactController = _MyContactControllerBase with _$MyContactController;

abstract class _MyContactControllerBase with Store {
  @observable
  ObservableList<MyContact> contacts = ObservableList.of([]);

  @observable
  String filter = "";

  @observable
  bool removed = false;

  @observable
  bool saved = false;

  @computed
  ObservableList<MyContact> get favorites => ObservableList<MyContact>.of(
      contacts.where((contact) => contact.favorite == true));

  @computed
  ObservableList<MyContact> get contactsFiltered {
    if (filter.isEmpty) {
      return contacts;
    } else {
      return contacts
          .where((contact) =>
              contact.name.toLowerCase().contains(filter.toLowerCase()))
          .toList()
          .asObservable();
    }
  }

  @action
  addContact(MyContact contact) {
    contacts.add(contact);
    saved = true;
  }

  @action
  removeContact(MyContact contact) {
    contacts.removeWhere((c) => c.email == contact.email);
    removed = true;
  }

  @action
  setFilter(String filter) => this.filter = filter;

  @action
  restoreRemovedFlag() => removed = false;

  @action
  restoreSavedFlag() => saved = false;
}
