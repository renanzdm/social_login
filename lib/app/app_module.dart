import 'package:lista_de_compras/app/authentication_repository.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:lista_de_compras/app/app_widget.dart';
import 'package:lista_de_compras/app/app_bloc.dart';
import 'package:lista_de_compras/app/pages/login/login_bloc.dart';

class AppModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => AppBloc()),
         Bloc((i) => LoginBloc(i.getDependency<AuthenticationRepository>())),
      ];

  @override
  List<Dependency> get dependencies => [
       Dependency((i) => AuthenticationRepository()),
      ];

  @override
  Widget get view => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
