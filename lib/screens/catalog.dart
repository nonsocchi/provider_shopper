import 'package:flutter/material.dart';

class MyCatalog extends StatelessWidget {
  const MyCatalog({Key? key}) : super(key: key);

  static const routeName = '/catalog';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: const Text('The catalog screen'),
      ),
    );
  }
}
