import '../../marketplace_module.dart';

class ListOffersUseCase {
  final IMarketplaceRepository _repository;
  ListOffersUseCase(this._repository);

  Future<List<OfferEntity>> call() async {
    return await _repository.listOffers();
  }
}
