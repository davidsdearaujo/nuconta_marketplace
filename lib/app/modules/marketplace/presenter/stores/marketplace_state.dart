import 'package:nuconta_marketplace/app/modules/core/core_module.dart';

import '../../marketplace_module.dart';

class MarketplaceState {
  final List<OfferEntity>? offers;
  final MoneyType balance;

  const MarketplaceState({required this.offers, required this.balance});
  const MarketplaceState.empty()
      : offers = null,
        balance = const MoneyType(0);

  MarketplaceState copyWith({
    List<OfferEntity>? offers,
    MoneyType? balance,
  }) {
    return MarketplaceState(
      offers: offers ?? this.offers,
      balance: balance ?? this.balance,
    );
  }
}
