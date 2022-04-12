import 'package:flutter/material.dart';
import 'package:provider_shopper/common/theme.dart';
import 'package:provider_shopper/screens/catalog.dart';
import 'package:provider_shopper/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Provider Demo',
      theme: appTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const MyLogin(),
        MyCatalog.routeName: (context) => const MyCatalog(),
      },
    );
  }
}
