import '../../marketplace_module.dart';

abstract class IMarketplaceDatasource {
  Future<void> buyOffer(int offerId);
  Future<double> getBalance();
  Future<List<OfferEntity>> listOffers();
}