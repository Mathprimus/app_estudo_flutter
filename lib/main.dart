import 'package:app_estudo_flutter/screens/exemplos/botoes/elevated.dart';
import 'package:app_estudo_flutter/screens/exemplos/button_screen.dart';
import 'package:app_estudo_flutter/screens/menu_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'Menu',
      routes: {
        'Menu': (context) => MenuScreen(),
        'botoes': (context) => ButtonScreen(),
        'elevated': (context) => ElevatedScreen()
      },
    );
  }
}
