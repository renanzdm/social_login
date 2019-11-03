import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lista_de_compras/app/app_module.dart';
import 'package:lista_de_compras/app/pages/home/home_module.dart';
import 'package:lista_de_compras/app/shared/components/login_email.dart';
import 'login_bloc.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

enum AuthType { facebook, google, email }

class _LoginPageState extends State<LoginPage> {
  var bloc = AppModule.to.getBloc<LoginBloc>();
  final imagePages = <String>[
    'images/teste.jpg',
    'images/teste.jpg',
    'images/teste.jpg',
  ];
  final authTypesList = <AuthType>[
    AuthType.facebook,
    AuthType.google,
    AuthType.email,
  ];

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  Widget build(BuildContext context) {
    var sizes = MediaQuery.of(context).size;

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            width: sizes.width,
            height: sizes.height * 0.80,
            child: PageView(
                children: imagePages.map((path) {
              return PageViewItem(
                image: path,
              );
            }).toList()),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: InkWell(
              onTap: () {},
              child: Text(
                'Login para continuar'.toUpperCase(),
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: authTypesList.map((authType) {
              return SocialButton(
                authType: authType,
                onTap: () async {
                  if (authType == AuthType.email) {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => LoginEmail()));
                  }
                  if (authType == AuthType.google) {
                    await bloc.signInGoogle();
                   if (bloc.testUser) {
                      Navigator.pushReplacement(context,
                        CupertinoPageRoute(builder: (contex) => HomeModule()));
                   }
                  }
                  if (authType == AuthType.facebook) {
                    await bloc.signInFacebook();
                    if (bloc.testUser) {
                      Navigator.pushReplacement(context,
                        CupertinoPageRoute(builder: (contex) => HomeModule()));
                    }
                    
                  }
                },
              );
            }).toList(),
          )
        ],
      ),
    ));
  }
}

class SocialButton extends StatelessWidget {
  final AuthType authType;
  final Function onTap;

  const SocialButton({Key key, @required this.authType, @required this.onTap})
      : assert(authType != null),
        assert(onTap != null);

  Widget _getChild() {
    switch (authType) {
      case AuthType.facebook:
        return Icon(FontAwesomeIcons.facebookF);
        break;
      case AuthType.google:
        return Icon(FontAwesomeIcons.google);
        break;
      case AuthType.email:
        return Text('Email'.toUpperCase());
        break;
    }
    return SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(), borderRadius: BorderRadius.circular(32)),
        padding: EdgeInsets.all(16),
        child: _getChild(),
      ),
    );
  }
}

class PageViewItem extends StatelessWidget {
  final String image;

  const PageViewItem({Key key, @required this.image})
      : assert(image != null),
        assert(image != '');

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Lista de Compras'.toUpperCase(),
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
          Text('Agilidade',
              style: TextStyle(fontSize: 20, color: Colors.white)),
          Text('Facilidade',
              style: TextStyle(fontSize: 20, color: Colors.white)),
          const Spacer(),
          Text('Facilidade',
              style: TextStyle(fontSize: 40, color: Colors.white)),
        ],
      ),
    );
  }
}
