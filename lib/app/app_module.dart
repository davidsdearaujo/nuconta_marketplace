import 'package:flutter_modular/flutter_modular.dart';
import 'package:nuconta_marketplace/app/modules/core/core_module.dart';

import 'modules/marketplace/marketplace_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: MarketplaceModule()),
  ];
}
