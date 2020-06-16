import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:minhaspautas/app/controllers/login/login_controller.dart';

class RecuperarSenhaPage extends StatefulWidget {
  @override
  _RecuperarSenhaPageState createState() => _RecuperarSenhaPageState();
}

class _RecuperarSenhaPageState extends State<RecuperarSenhaPage> {
  var _textEditingController = TextEditingController();
  LoginController _controller;

  @override
  void initState() {
    super.initState();

    _controller = Modular.get<LoginController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Recuperar senha"),
      ),
      body: Builder(
        builder: (context) => SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "assets/recuperar_senha.png",
                    height: MediaQuery.of(context).size.height / 4,
                    width: MediaQuery.of(context).size.width / 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Text(
                      "Recuperar senha",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 30),
                    child: Text(
                      "Por favor, informe o E-mal associado a sua conta que enviaremos um link para restauração da sua senha.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 30),
                    child: TextField(
                      controller: _textEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 15),
                        hintText: "Endereço de email",
                      ),
                    ),
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 45,
                      alignment: Alignment.center,
                      child: Text(
                        "Enviar",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    onPressed: () {
                      _controller.recuperarSenha(email: _textEditingController.text.trim()).catchError(
                        (error) {
                          var scnackbar = SnackBar(
                            content: Text(error.message),
                          );
                          Scaffold.of(context).showSnackBar(scnackbar);
                        },
                      );
                      // if (_textEditingController.text.trim().isEmpty) {
                      //   var scnackbar = SnackBar(
                      //     content: Text("E-mail não informado!"),
                      //   );
                      //   Scaffold.of(context).showSnackBar(scnackbar);
                      // } else{

                      //   _controller.recuperarSenha(email: _textEditingController.text.trim());
                      // }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
