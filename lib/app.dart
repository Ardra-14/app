import 'package:flutter/material.dart';
import 'package:my_app/intro_page.dart';
import 'package:my_app/models/cart_provider.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: 'Shopping App',
        home: IntroPage(),
      ),
    );
  }
}