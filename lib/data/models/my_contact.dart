// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
part 'my_contact.g.dart';

class MyContact = _MyContactBase with _$MyContact;

abstract class _MyContactBase with Store {
  @observable
  String name = "";

  @observable
  String email = "";

  @observable
  String cellphone = "";

  @observable
  bool favorite = false;

  @action
  setName(String name) => this.name = name;

  @action
  setEmail(String email) => this.email = email;

  @action
  setCellphone(String cellphone) => this.cellphone = cellphone;

  @action
  setFavorite() => favorite = !favorite;
}
