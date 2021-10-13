import 'package:nuconta_marketplace/app/modules/core/core_module.dart';

import '../../marketplace_module.dart';

abstract class IMarketplaceRepository {
  Future<void> buyOffer(String offerId);
  Future<MoneyType> getBalance();
  Future<List<OfferEntity>> listOffers();
}
