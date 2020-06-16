import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Color(0xff030D38)));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Modular.navigatorKey,
      title: 'Minhas pautas',
      theme: ThemeData(
        buttonColor: Color(0xff030D38),
        backgroundColor: Color(0xff030D38),
        appBarTheme: AppBarTheme(color: Color(0xff030D38)),
        accentColor: Color(0xff030D38),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: EdgeInsets.only(left: 10),
          hintStyle: TextStyle(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
