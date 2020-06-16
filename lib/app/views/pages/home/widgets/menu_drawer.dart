import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:minhaspautas/app/controllers/login/login_controller.dart';
import 'package:minhaspautas/app/models/user_model.dart';

class MenuDrawer extends StatelessWidget {
  final User user;

  const MenuDrawer({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {    
    final _loginControler = Modular.get<LoginController>();
    return ListView(      
      children: <Widget>[
        UserAccountsDrawerHeader(
          arrowColor: Colors.red,
          accountName: Text(user.name),
          accountEmail: Text(user.email),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text(
              user.name[0].toUpperCase(),
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
