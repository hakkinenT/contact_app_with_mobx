import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/controllers/my_contact_controller.dart';

class SearchTextFormField extends StatefulWidget {
  const SearchTextFormField({
    super.key,
  });

  @override
  State<SearchTextFormField> createState() => _SearchTextFormFieldState();
}

class _SearchTextFormFieldState extends State<SearchTextFormField> {
  late final MyContactController controller;

  @override
  void initState() {
    super.initState();
    controller = Provider.of<MyContactController>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor.withOpacity(0.5);

    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        onChanged: controller.setFilter,
        decoration: inputDecoration,
      ),
    );
  }

  final InputDecoration inputDecoration = const InputDecoration(
    border: UnderlineInputBorder(
      borderSide: BorderSide.none,
    ),
    hintText: "Procurar...",
    prefixIcon: Icon(Icons.search),
  );
}
