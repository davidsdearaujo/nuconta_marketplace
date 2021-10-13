import 'package:nuconta_marketplace/app/modules/core/core_module.dart';

import '../../marketplace_module.dart';

class GetBalanceUseCase {
  final IMarketplaceRepository _repository;
  GetBalanceUseCase(this._repository);

  Future<MoneyType> call() async {
    return await _repository.getBalance();
  }
}
