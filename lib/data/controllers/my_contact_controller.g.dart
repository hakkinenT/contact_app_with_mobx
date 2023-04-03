// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_contact_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MyContactController on _MyContactControllerBase, Store {
  Computed<ObservableList<MyContact>>? _$favoritesComputed;

  @override
  ObservableList<MyContact> get favorites => (_$favoritesComputed ??=
          Computed<ObservableList<MyContact>>(() => super.favorites,
              name: '_MyContactControllerBase.favorites'))
      .value;
  Computed<ObservableList<MyContact>>? _$contactsFilteredComputed;

  @override
  ObservableList<MyContact> get contactsFiltered =>
      (_$contactsFilteredComputed ??= Computed<ObservableList<MyContact>>(
              () => super.contactsFiltered,
              name: '_MyContactControllerBase.contactsFiltered'))
          .value;

  late final _$contactsAtom =
      Atom(name: '_MyContactControllerBase.contacts', context: context);

  @override
  ObservableList<MyContact> get contacts {
    _$contactsAtom.reportRead();
    return super.contacts;
  }

  @override
  set contacts(ObservableList<MyContact> value) {
    _$contactsAtom.reportWrite(value, super.contacts, () {
      super.contacts = value;
    });
  }

  late final _$filterAtom =
      Atom(name: '_MyContactControllerBase.filter', context: context);

  @override
  String get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(String value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  late final _$removedAtom =
      Atom(name: '_MyContactControllerBase.removed', context: context);

  @override
  bool get removed {
    _$removedAtom.reportRead();
    return super.removed;
  }

  @override
  set removed(bool value) {
    _$removedAtom.reportWrite(value, super.removed, () {
      super.removed = value;
    });
  }

  late final _$savedAtom =
      Atom(name: '_MyContactControllerBase.saved', context: context);

  @override
  bool get saved {
    _$savedAtom.reportRead();
    return super.saved;
  }

  @override
  set saved(bool value) {
    _$savedAtom.reportWrite(value, super.saved, () {
      super.saved = value;
    });
  }

  late final _$_MyContactControllerBaseActionController =
      ActionController(name: '_MyContactControllerBase', context: context);

  @override
  dynamic addContact(MyContact contact) {
    final _$actionInfo = _$_MyContactControllerBaseActionController.startAction(
        name: '_MyContactControllerBase.addContact');
    try {
      return super.addContact(contact);
    } finally {
      _$_MyContactControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeContact(MyContact contact) {
    final _$actionInfo = _$_MyContactControllerBaseActionController.startAction(
        name: '_MyContactControllerBase.removeContact');
    try {
      return super.removeContact(contact);
    } finally {
      _$_MyContactControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFilter(String filter) {
    final _$actionInfo = _$_MyContactControllerBaseActionController.startAction(
        name: '_MyContactControllerBase.setFilter');
    try {
      return super.setFilter(filter);
    } finally {
      _$_MyContactControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic restoreRemovedFlag() {
    final _$actionInfo = _$_MyContactControllerBaseActionController.startAction(
        name: '_MyContactControllerBase.restoreRemovedFlag');
    try {
      return super.restoreRemovedFlag();
    } finally {
      _$_MyContactControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic restoreSavedFlag() {
    final _$actionInfo = _$_MyContactControllerBaseActionController.startAction(
        name: '_MyContactControllerBase.restoreSavedFlag');
    try {
      return super.restoreSavedFlag();
    } finally {
      _$_MyContactControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
contacts: ${contacts},
filter: ${filter},
removed: ${removed},
saved: ${saved},
favorites: ${favorites},
contactsFiltered: ${contactsFiltered}
    ''';
  }
}
