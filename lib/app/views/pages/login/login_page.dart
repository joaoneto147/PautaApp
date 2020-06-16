import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:minhaspautas/app/controllers/login/login_controller.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController _controller;

  @override
  void initState() {
    super.initState();

    _controller = Modular.get<LoginController>();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.limparCampos();
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrar"),
      ),
      body: SingleChildScrollView(
        child: Observer(
          name: "loginpage",
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "assets/login.png",
                  ),
                  SizedBox(height: 20),
                  TextField(
                    onChanged: _controller.setEmail,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: "Email",
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    onChanged: _controller.setSenha,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.vpn_key),
                      hintText: "Senha",
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      padding: EdgeInsets.zero,
                      child:
                          Text("Esqueceu sua senha?", textAlign: TextAlign.end),
                      onPressed: _controller.doRecovery,
                    ),
                  ),
                  _controller.realizandoLogin
                      ? CircularProgressIndicator()
                      : RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 45,
                            alignment: Alignment.center,
                            child: Text(
                              "Entrar",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                          onPressed: _controller.habilitarLoginButton
                              ? () async {
                                  await _controller.realizarLogin().catchError(
                                    (error) {
                                      var scnackbar = SnackBar(
                                        content: Text(error.message),
                                      );
                                      Scaffold.of(context)
                                          .showSnackBar(scnackbar);
                                    },
                                  );
                                }
                              : null,
                        ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Não possui acesso? "),
                      GestureDetector(
                          child: Text(
                            "Cadastre-se aqui",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: _controller.doRegister),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
