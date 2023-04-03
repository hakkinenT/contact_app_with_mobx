import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../data/controllers/home_bar.dart';
import '../../data/controllers/my_contact_controller.dart';
import '../register_contact/register_contact.dart';
import 'widgets/contacts.dart';
import 'widgets/empty_list.dart';
import 'widgets/page_body.dart';
import 'widgets/search_text_form_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => HomeBar(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  static const pages = <Widget>[
    ContactsPageContent(),
    FavoritesPageContent(),
  ];

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  late final HomeBar homeBar;

  late ReactionDisposer disposer;

  @override
  void initState() {
    super.initState();
    homeBar = Provider.of<HomeBar>(context, listen: false);
    final controller = Provider.of<MyContactController>(context, listen: false);

    disposer = reaction((_) => controller.removed, (removed) {
      if (removed) {
        controller.restoreRemovedFlag();

        WidgetsBinding.instance.addPostFrameCallback((_) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text("Contato removido com sucesso!"),
              ),
            );
        });
      }
    });
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Observer(
        builder: (_) {
          return SafeArea(
            child: pages.elementAt(homeBar.selectedIndex),
          );
        },
      ),
      bottomNavigationBar: Observer(
        builder: (_) {
          return _bottomNavigationBar(
            currentIndex: homeBar.selectedIndex,
            onTap: homeBar.onItemTapped,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const RegisterContactPage()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  BottomNavigationBar _bottomNavigationBar(
      {required int currentIndex, ValueChanged<int>? onTap}) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.star),
          label: "Favoritos",
        ),
      ],
      currentIndex: currentIndex,
      onTap: onTap,
    );
  }
}

class ContactsPageContent extends StatelessWidget {
  const ContactsPageContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PageBody(
      title: "Contatos",
      body: [
        const SearchTextFormField(),
        const SizedBox(
          height: 24,
        ),
        Expanded(
          child: Observer(builder: (_) {
            final controller =
                Provider.of<MyContactController>(context, listen: false);
            final contacts = controller.contactsFiltered;

            if (contacts.isEmpty) {
              return const EmptyList();
            }

            return Contacts(contacts: contacts);
          }),
        ),
      ],
    );
  }
}

class FavoritesPageContent extends StatelessWidget {
  const FavoritesPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return PageBody(
      title: "Favoritos",
      body: [
        Expanded(
          child: Observer(builder: (_) {
            final controller =
                Provider.of<MyContactController>(context, listen: false);
            final favorites = controller.favorites;

            if (favorites.isEmpty) {
              return const EmptyList();
            }

            return Contacts(contacts: favorites);
          }),
        ),
      ],
    );
  }
}
