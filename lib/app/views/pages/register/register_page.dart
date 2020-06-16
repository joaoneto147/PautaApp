import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:minhaspautas/app/controllers/register/register_controller.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterController _controller;

  @override
  void initState() {
    super.initState();
    _controller = Modular.get<RegisterController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar"),
      ),
      body: SingleChildScrollView(
        child: Observer(
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "assets/cadastrar.png",
                    fit: BoxFit.cover,
                  ),
                  TextField(
                    onChanged: _controller.setNome,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: "Nome",
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    onChanged: _controller.setEmail,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.mail),
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
                  SizedBox(height: 10),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 45,
                      alignment: Alignment.center,
                      child: Text(
                        "Cadastrar",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    onPressed: _controller.habilitarCadastroButton
                        ? () async {
                            await _controller.registrar().catchError(
                              (error) {
                                var scnackbar = SnackBar(
                                  content: Text(error.message),
                                );
                                Scaffold.of(context).showSnackBar(scnackbar);
                              },
                            );
                          }
                        : null,
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
