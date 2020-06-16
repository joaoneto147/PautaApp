import 'package:flutter_modular/flutter_modular.dart';
import 'package:minhaspautas/app/controllers/pauta/pauta_controller.dart';
import 'package:minhaspautas/app/views/pages/pauta/pauta_page.dart';

class PautaModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => PautaController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => PautaPage(), transition: TransitionType.scale),
      ];

  static Inject get to => Inject<PautaModule>.of();
}
