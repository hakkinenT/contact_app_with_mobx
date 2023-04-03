// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/foundation.dart';
import 'package:flutter_contact_app_with_mobx/data/models/my_contact.dart';
import 'package:flutter_contact_app_with_mobx/utils/validator/validator_mixin.dart';
import 'package:mobx/mobx.dart';
part 'form_validator_controller.g.dart';

class FormValidatorController = _FormValidatorControllerBase
    with _$FormValidatorController;

abstract class _FormValidatorControllerBase with Store, ValidatorMixin {
  MyContact contact = MyContact();

  @computed
  bool get isValidate =>
      validateName() == null &&
      validateEmail() == null &&
      validateCellphone() == null;

  String? validateName() {
    final errorMessage = combine(
      [
        () => isNotEmpty(contact.name),
        () => isNameValid(contact.name),
      ],
    );

    return errorMessage;
  }

  String? validateEmail() {
    final errorMessage = combine(
      [
        () => isNotEmpty(contact.email),
        () => isEmailValid(contact.email),
      ],
    );

    return errorMessage;
  }

  String? validateCellphone() {
    final errorMessage = combine(
      [
        () => isNotEmpty(contact.cellphone),
        () => isCellphoneValid(contact.cellphone),
      ],
    );

    return errorMessage;
  }
}
