import '../../marketplace_module.dart';

class MarketplaceRepository implements IMarketplaceRepository {
  final IMarketplaceDatasource datasource;
  MarketplaceRepository(this.datasource);

  @override
  Future<void> buyOffer(String offerId) {
    return datasource.buyOffer(offerId);
  }

  @override
  Future<double> getBalance() {
    return datasource.getBalance();
  }

  @override
  Future<List<OfferEntity>> listOffers() {
    return datasource.listOffers();
  }
}
