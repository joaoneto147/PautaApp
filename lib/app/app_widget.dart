import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.blue));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Modular.navigatorKey,
      title: 'Minhas pautas',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          backgroundColor: Colors.blue,
          accentColor: Colors.blueAccent,
          inputDecorationTheme: InputDecorationTheme(
            contentPadding: EdgeInsets.only(left: 10),
            hintStyle: TextStyle(),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.grey),
            ),
          )),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
