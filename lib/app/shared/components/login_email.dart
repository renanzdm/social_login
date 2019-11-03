import 'package:flutter/material.dart';

class LoginEmail extends StatefulWidget {
  @override
  _LoginEmailState createState() => _LoginEmailState();
}

TabController _tabController;

class _LoginEmailState extends State<LoginEmail>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var sizes = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(horizontal: 8),
              width: sizes.width,
              height: sizes.height * 0.35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://www.proteste.org.br/-/media/proteste/images/home/suas-contas/supermercados/supermercado-compras-online.jpg?rev=a8507ea5-ff9b-40a0-97e2-c161f65e4b79'),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor),
                    child: Icon(
                      Icons.person_add,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    width: 250,
                    child: TabBar(
                      indicatorColor: Colors.white,
                      indicatorSize: TabBarIndicatorSize.label,
                      controller: _tabController,
                      tabs: <Widget>[
                        Text('Login'.toUpperCase()),
                        Text('Criar Conta'.toUpperCase()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: sizes.width,
              height: sizes.height * 0.65,
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: <Widget>[
                  LoginContent(),
                  RegistrationContent(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Spacer(),
          Padding(
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration:
                  InputDecoration(hintText: 'Email', icon: Icon(Icons.email)),
            ),
            padding: const EdgeInsets.only(bottom: 32),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: 'Pasword',
                  icon: Icon(Icons.lock),
                  suffixIcon: Text(
                    'Forgot ?',
                    style: TextStyle(color: Colors.grey),
                  )),
            ),
          ),
          Spacer(),
          ButtomBottom(),
        ],
      ),
    );
  }
}

class RegistrationContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Spacer(),
          Padding(
            child: TextField(
              decoration:
                  InputDecoration(hintText: 'Nome', icon: Icon(Icons.person)),
            ),
            padding: const EdgeInsets.only(bottom: 32),
          ),
          Padding(
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration:
                  InputDecoration(hintText: 'Email', icon: Icon(Icons.email)),
            ),
            padding: const EdgeInsets.only(bottom: 32),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: 'Pasword',
                  icon: Icon(Icons.lock),
                  suffixIcon: Text(
                    'Forgot ?',
                    style: TextStyle(color: Colors.grey),
                  )),
            ),
          ),
          Spacer(),
          ButtomBottom(),
        ],
      ),
    );
  }
}

class ButtomBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8, left: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Row(
              children: <Widget>[
                Icon(Icons.arrow_back),
                SizedBox(
                  width: 4,
                ),
                Text('Social Login')
              ],
            ),
          ),
          GestureDetector(
            onTap: () {/*TODO: perform login operation*/},
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle),
              child: Center(
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
