// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
part 'home_bar.g.dart';

class HomeBar = _HomeBarBase with _$HomeBar;

abstract class _HomeBarBase with Store {
  @observable
  int selectedIndex = 0;

  @action
  onItemTapped(int index) {
    selectedIndex = index;
  }
}
