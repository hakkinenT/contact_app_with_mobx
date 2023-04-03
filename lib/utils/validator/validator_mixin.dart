mixin ValidatorMixin {
  String? isNotEmpty(String? value, [String? message]) {
    if (value!.isEmpty) return message ?? "Este campo é obrigatório!";

    return null;
  }

  String? isNameValid(String? value, [String? message]) {
    if (value!.length < 4) return message ?? "Informe um nome válido";

    return null;
  }

  String? isEmailValid(String? value, [String? message]) {
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value!);

    if (!emailValid) {
      return message ?? "Informe um email válido";
    }

    return null;
  }

  String? isCellphoneValid(String? value, [String? message]) {
    if (value!.length < 16) {
      return message ?? "Informe um número de celular válido";
    }

    return null;
  }

  String? combine(List<String? Function()> validators) {
    for (final func in validators) {
      final validation = func();

      if (validation != null) return validation;
    }

    return null;
  }
}
