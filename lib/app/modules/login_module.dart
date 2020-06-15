import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:minhaspautas/app/controllers/login/login_controller.dart';
import 'package:minhaspautas/app/interfaces/iauth_repository.dart';
import 'package:minhaspautas/app/repositories/auth_repository.dart';
import 'package:minhaspautas/app/repositories/user_repository.dart';
import 'package:minhaspautas/app/views/pages/login/login_page.dart';

class LoginModule extends ChildModule {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  List<Bind> get binds => [
        Bind(
          (i) => LoginController(),
        ),
        Bind((i) => UserRepository()),
        Bind<IAuthRepository>(
          (i) => AuthRepository(firebaseAuth),
        ),
      ];

  @override
  List<Router> get routers =>
      [Router(Modular.initialRoute, child: (_, args) => LoginPage())];

  static Inject get to => Inject<LoginModule>.of();
}
