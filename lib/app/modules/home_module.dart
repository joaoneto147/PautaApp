import 'package:flutter_modular/flutter_modular.dart';
import 'package:minhaspautas/app/controllers/home/home_controller.dart';
import 'package:minhaspautas/app/controllers/login/login_controller.dart';
import 'package:minhaspautas/app/controllers/pauta/pauta_controller.dart';
import 'package:minhaspautas/app/views/pages/home/home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
        Bind((i) => PautaController()),
        Bind((i) => LoginController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
