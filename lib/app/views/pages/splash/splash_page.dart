import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:minhaspautas/app/interfaces/iauth_repository.dart';
import 'package:minhaspautas/app/shared/const/router_const.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    checkUserStatus();
  }

  Future<void> checkUserStatus() async {
    //await Future.delayed(Duration(seconds: 2));
    IAuthRepository repostory = Modular.get();
    var response = await repostory.getUser();
    FirebaseUser user = response.object;

    if (user == null) {
      Modular.to.pushReplacementNamed(RoutersConst.login);
    } else {
      Modular.to.pushReplacementNamed(RoutersConst.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Image.asset("assets/logo-branco.png"),
              CircularProgressIndicator(backgroundColor: Colors.white),
            ],
          ),
        ));
  }
}
