import 'package:flutter/material.dart';

class PageBody extends StatelessWidget {
  const PageBody({
    super.key,
    required this.title,
    required this.body,
  });

  final String title;
  final List<Widget> body;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageTitle(
            title: title,
          ),
          const SizedBox(
            height: 16,
          ),
          ...body,
        ],
      ),
    );
  }
}

class PageTitle extends StatelessWidget {
  const PageTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
