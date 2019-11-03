import 'dart:async';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:lista_de_compras/app/app_module.dart';
import 'package:lista_de_compras/app/pages/home/home_module.dart';
import 'package:lista_de_compras/app/pages/login/login_bloc.dart';
import 'package:lista_de_compras/app/pages/login/login_module.dart';



class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

var bloc = AppModule.to.getBloc<LoginBloc>();
StreamSubscription subscription;

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5), () {
      subscription = bloc.outState.listen((state) {
        switch (state) {
          case true:
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomeModule()));
            break;
          case false:
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginModule()));
            break;
          default:
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FlareActor('images/splash.flr',animation: 'forward',),
      ),
    );
  }
}
