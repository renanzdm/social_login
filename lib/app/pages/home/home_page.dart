import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lista_de_compras/app/pages/login/login_module.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.signal_cellular_4_bar),
            onPressed: () {
              firebaseAuth.signOut();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginModule()));
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
