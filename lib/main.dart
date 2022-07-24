import 'package:app_ferreteria_ronny/pages/home_page.dart';
import 'package:app_ferreteria_ronny/pages/products_page.dart';
import 'package:app_ferreteria_ronny/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicativo Ferretería Ronny',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RegisterPage(),
      routes: <String, WidgetBuilder> {
        '/register': (BuildContext context) => const RegisterPage(),
        '/products': (BuildContext context) => const ProductsPage(), 
      });
  }
}

