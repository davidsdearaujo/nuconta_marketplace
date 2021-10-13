import '../../marketplace_module.dart';

class BuyOfferUseCase {
  final IMarketplaceRepository _repository;
  BuyOfferUseCase(this._repository);

  Future<void> call(int offerId) async {
    return await _repository.buyOffer(offerId);
  }
}
