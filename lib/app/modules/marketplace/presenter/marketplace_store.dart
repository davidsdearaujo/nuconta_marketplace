import 'package:flutter_triple/flutter_triple.dart';
import 'package:nuconta_marketplace/app/modules/core/core_module.dart';

import '../marketplace_module.dart';
import 'marketplace_state.dart';

export 'marketplace_state.dart';

class MarketplaceStore extends NotifierStore<Failure, MarketplaceState> {
  final ListOffersUseCase _listOffersUseCase;
  final GetBalanceUseCase _getBalanceUseCase;
  final BuyOfferUseCase _buyOfferUseCase;
  MarketplaceStore(this._listOffersUseCase, this._getBalanceUseCase, this._buyOfferUseCase) : super(const MarketplaceState.empty());
  
  Future<void> refreshAll() => Future.wait([refreshOffers(), refreshBalance()]);

  Future<void> refreshOffers() async {
    try {
      setLoading(true);
      final offers = await _listOffersUseCase.call();
      update(state.copyWith(offers: offers));
    } on Failure catch (failure) {
      setError(failure);
    } catch (exception, stacktrace) {
      setError(InternalFailure(exception, stacktrace));
    } finally {
      setLoading(false);
    }
  }

  Future<void> refreshBalance() async {
    try {
      setLoading(true);
      final balance = await _getBalanceUseCase.call();
      update(state.copyWith(balance: balance));
    } on Failure catch (failure) {
      setError(failure);
    } catch (exception, stacktrace) {
      setError(InternalFailure(exception, stacktrace));
    } finally {
      setLoading(false);
    }
  }

  Future<void> buyOffer(String offerId) async {
    try {
      setLoading(true);
      await _buyOfferUseCase.call(offerId);
    } on Failure catch (failure) {
      setError(failure);
    } catch (exception, stacktrace) {
      setError(InternalFailure(exception, stacktrace));
    } finally {
      setLoading(false);
    }
  }
}
