import 'package:firebase_auth/firebase_auth.dart';
import 'package:minhaspautas/app/controllers/login/login_controller.dart';
import 'package:minhaspautas/app/modules/pauta_module.dart';
import 'package:minhaspautas/app/repositories/auth_repository.dart';

import 'package:minhaspautas/app/repositories/pauta_repository.dart';
import 'package:minhaspautas/app/repositories/user_repository.dart';
import 'package:minhaspautas/app/views/pages/home/widgets/menu_drawer.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:minhaspautas/app/app_widget.dart';

import 'interfaces/iauth_repository.dart';
import 'views/pages/splash/splash_page.dart';
import 'shared/const/router_const.dart';
import 'modules/home_module.dart';
import 'modules/login_module.dart';
import 'modules/register_module.dart';

class AppModule extends MainModule {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  List<Bind> get binds => [
        Bind<IAuthRepository>(
          (i) => AuthRepository(firebaseAuth),
        ),
        Bind(
          (i) => AppController(),
        ),
        Bind(
          (i) => PautaRepository(),
        ),
        Bind(
          (i) => LoginController(),
        ),
        Bind(
          (i) => UserRepository(),
        ),
      ];

  @override
  List<Router> get routers => [
        Router(
          RoutersConst.splash,
          child: (_, args) => SplashPage(),
        ),
        Router(
          RoutersConst.login,
          module: LoginModule(),
        ),
        Router(
          RoutersConst.home,
          module: HomeModule(),
        ),
        Router(
          RoutersConst.register,
          module: RegisterModule(),
        ),
        Router(
          RoutersConst.pauta,
          module: PautaModule(),
        ),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
