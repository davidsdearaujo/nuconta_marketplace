import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/marketplace_page.dart';
import 'presenter/marketplace_store.dart';

//Entities
export 'domain/entities/offer_entity.dart';
//Repositories
export 'domain/repositories/marketplace_repository.dart';
//Use cases
export 'domain/use_cases/buy_offer.dart';
export 'domain/use_cases/get_balance.dart';
export 'domain/use_cases/list_offers.dart';

class MarketplaceModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => MarketplaceStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => MarketplacePage()),
  ];
}
