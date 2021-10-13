import 'package:flutter_modular/flutter_modular.dart';
import 'package:nuconta_marketplace/app/modules/core/core_module.dart';

import 'domain/use_cases/buy_offer.dart';
import 'domain/use_cases/get_balance.dart';
import 'domain/use_cases/list_offers.dart';
import 'external/datasources/marketplace_datasource.dart';
import 'external/mappers/offer_mapper.dart';
import 'infra/repositories/marketplace_repository.dart';
import 'presenter/marketplace_page.dart';
import 'presenter/marketplace_store.dart';

//Entities
export 'domain/entities/offer_entity.dart';
//Repositorie interfaces
export 'domain/repositories/marketplace_repository.dart';
//Use cases
export 'domain/use_cases/buy_offer.dart';
export 'domain/use_cases/get_balance.dart';
export 'domain/use_cases/list_offers.dart';
//Datasource interfaces
export 'infra/datasources/marketplace_datasource.dart';

class MarketplaceModule extends Module {
  @override
  final List<Module> imports = [CoreModule()];

  @override
  final List<Bind> binds = [
    //Usecases
    Bind.lazySingleton((i) => BuyOfferUseCase(i())),
    Bind.lazySingleton((i) => GetBalanceUseCase(i())),
    Bind.lazySingleton((i) => ListOffersUseCase(i())),
    //Repositories
    Bind.lazySingleton((i) => MarketplaceRepository(i())),
    //Datasources
    Bind.lazySingleton((i) => MarketplaceDatasource(i(), i())),
    //Others
    Bind.lazySingleton((i) => const OfferMapper()),
    //Stores
    Bind.lazySingleton((i) => MarketplaceStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => MarketplacePage()),
  ];
}
