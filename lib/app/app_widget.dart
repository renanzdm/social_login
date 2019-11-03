import 'package:flutter/material.dart';
import 'package:lista_de_compras/app/shared/splash/splash_page.dart';
class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Slidy',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashPage());
  }
}
