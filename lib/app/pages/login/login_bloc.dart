import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lista_de_compras/app/authentication_repository.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends BlocBase {
  final AuthenticationRepository _repository;
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool testUser = false;

  StreamSubscription _streamSubscription;

  LoginBloc(this._repository) {
    checkUser();
  }

  final _stateController = BehaviorSubject<bool>();

  Observable<bool> get outState => _stateController.stream;

  signInFacebook() async {
    testUser = await _repository.signFacebook();
    return testUser;
  }

  signInGoogle() async {
    testUser = await _repository.signGoogle();
    return testUser;
  }

  signInEmailPass(String email, String pass) async {
    testUser = await _repository.signEmailPass(email, pass);
    return testUser;
  }

  checkUser() async {
    _streamSubscription =
        FirebaseAuth.instance.onAuthStateChanged.listen((user) async {
      if (user != null) {
        _stateController.sink.add(true);
      } else {
        _stateController.sink.add(false);
      }
    });
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    _stateController.close();
    super.dispose();
  }
}
