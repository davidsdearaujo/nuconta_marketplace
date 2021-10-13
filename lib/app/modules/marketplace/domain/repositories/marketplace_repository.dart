import '../../marketplace_module.dart';

abstract class IMarketplaceRepository {
  Future<void> buyOffer(String offerId);
  Future<double> getBalance();
  Future<List<OfferEntity>> listOffers();
}
