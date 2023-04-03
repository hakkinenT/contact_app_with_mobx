import 'package:flutter/services.dart';

enum PhoneType {
  cellphone,
  phone;

  bool get isCellphone => PhoneType.cellphone == this;
}

class PhoneNumberFormatter extends TextInputFormatter {
  final PhoneType phoneType;

  PhoneNumberFormatter({this.phoneType = PhoneType.phone});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (!oldValue.text.contains("(") &&
        oldValue.text.length >= 10 &&
        newValue.text.length != oldValue.text.length) {
      return const TextEditingValue(
        text: "",
        selection: TextSelection.collapsed(offset: 0),
      );
    }

    if (oldValue.text.length > newValue.text.length) {
      return TextEditingValue(
        text: newValue.text.toString(),
        selection: TextSelection.collapsed(offset: newValue.text.length),
      );
    }

    int underscorePosition = 9;

    if (phoneType.isCellphone) underscorePosition = 11;

    var newText = newValue.text;
    int currentPosition = newText.length;

    if (currentPosition == 1) newText = '($newText';
    if (currentPosition == 3) newText = '$newText) ';

    if (phoneType.isCellphone && currentPosition == 6) {
      newText = '$newText ';
    }

    if (currentPosition == underscorePosition) newText = '$newText-';

    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
