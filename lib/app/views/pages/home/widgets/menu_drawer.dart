import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:minhaspautas/app/controllers/login/login_controller.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _loginControler = Modular.get<LoginController>();
    return ListView(      
      children: <Widget>[
        UserAccountsDrawerHeader(
          arrowColor: Colors.red,
          accountName: Text("João Batista"),
          accountEmail: Text("by.srneto@gmail.com"),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text(
              "J",
              style: TextStyle(fontSize: 40.0),
            ),
          ),
        ),
        ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Logout"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              _loginControler.deslogar();                         
            })
      ],
    );
  }
}
