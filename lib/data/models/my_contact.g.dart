// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_contact.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MyContact on _MyContactBase, Store {
  late final _$nameAtom = Atom(name: '_MyContactBase.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$emailAtom = Atom(name: '_MyContactBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$cellphoneAtom =
      Atom(name: '_MyContactBase.cellphone', context: context);

  @override
  String get cellphone {
    _$cellphoneAtom.reportRead();
    return super.cellphone;
  }

  @override
  set cellphone(String value) {
    _$cellphoneAtom.reportWrite(value, super.cellphone, () {
      super.cellphone = value;
    });
  }

  late final _$favoriteAtom =
      Atom(name: '_MyContactBase.favorite', context: context);

  @override
  bool get favorite {
    _$favoriteAtom.reportRead();
    return super.favorite;
  }

  @override
  set favorite(bool value) {
    _$favoriteAtom.reportWrite(value, super.favorite, () {
      super.favorite = value;
    });
  }

  late final _$_MyContactBaseActionController =
      ActionController(name: '_MyContactBase', context: context);

  @override
  dynamic setName(String name) {
    final _$actionInfo = _$_MyContactBaseActionController.startAction(
        name: '_MyContactBase.setName');
    try {
      return super.setName(name);
    } finally {
      _$_MyContactBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEmail(String email) {
    final _$actionInfo = _$_MyContactBaseActionController.startAction(
        name: '_MyContactBase.setEmail');
    try {
      return super.setEmail(email);
    } finally {
      _$_MyContactBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCellphone(String cellphone) {
    final _$actionInfo = _$_MyContactBaseActionController.startAction(
        name: '_MyContactBase.setCellphone');
    try {
      return super.setCellphone(cellphone);
    } finally {
      _$_MyContactBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFavorite() {
    final _$actionInfo = _$_MyContactBaseActionController.startAction(
        name: '_MyContactBase.setFavorite');
    try {
      return super.setFavorite();
    } finally {
      _$_MyContactBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
email: ${email},
cellphone: ${cellphone},
favorite: ${favorite}
    ''';
  }
}
