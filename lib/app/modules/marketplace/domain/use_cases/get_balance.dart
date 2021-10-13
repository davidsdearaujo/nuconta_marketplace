import '../../marketplace_module.dart';

class GetBalanceUseCase {
  final IMarketplaceRepository _repository;
  GetBalanceUseCase(this._repository);

  Future<double> call() async {
    return await _repository.getBalance();
  }
}
