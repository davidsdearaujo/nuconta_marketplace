import 'package:flutter_triple/flutter_triple.dart';
import 'package:nuconta_marketplace/app/modules/core/core_module.dart';

import '../../marketplace_module.dart';
import 'marketplace_state.dart';

export 'marketplace_state.dart';

class MarketplaceStore extends StreamStore<Failure, MarketplaceState> {
  final ListOffersUseCase _listOffersUseCase;
  final GetBalanceUseCase _getBalanceUseCase;
  final BuyOfferUseCase _buyOfferUseCase;
  MarketplaceStore(this._listOffersUseCase, this._getBalanceUseCase, this._buyOfferUseCase) : super(const MarketplaceState.empty());

  Future<void> refresh() async {
    try {
      setLoading(true);
      await Future.wait([_refreshOffers(), _refreshBalance()]);
    } on Failure catch (failure) {
      setError(failure);
      rethrow;
    } catch (exception, stacktrace) {
      setError(InternalFailure(exception, stacktrace));
      rethrow;
    } finally {
      setLoading(false);
    }
  }

  Future<void> _refreshOffers() async {
    final offers = await _listOffersUseCase.call();
    update(state.copyWith(offers: offers));
  }

  Future<void> _refreshBalance() async {
    final balance = await _getBalanceUseCase.call();
    update(state.copyWith(balance: balance));
  }

  Future<void> buyOffer(String offerId) async {
    try {
      setLoading(true);
      await _buyOfferUseCase.call(offerId);
    } on Failure catch (failure) {
      setError(failure);
      rethrow;
    } catch (exception, stacktrace) {
      setError(InternalFailure(exception, stacktrace));
      rethrow;
    } finally {
      setLoading(false);
    }
  }
}
