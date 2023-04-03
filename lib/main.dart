import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/controllers/my_contact_controller.dart';
import 'page/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => MyContactController(),
      child: MaterialApp(
        title: 'Contato App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
