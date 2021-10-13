import 'package:nuconta_marketplace/app/modules/core/core_module.dart';

import '../../marketplace_module.dart';
import '../failures/null_server_response_failure.dart';
import '../failures/server_failure.dart';
import '../graphql/marketplace_documents.dart';
import '../mappers/offer_mapper.dart';

class MarketplaceDatasource implements IMarketplaceDatasource {
  final HasuraConnect _client;
  final OfferMapper _offerMapper;
  MarketplaceDatasource(this._client, this._offerMapper);

  @override
  Future<void> buyOffer(String offerId) async {
    final response = await _client.mutation(MarketplaceDocuments.buyOffer, variables: {'offerId': offerId});
    _catchMutationError(response['data']['purchase']);
  }

  @override
  Future<MoneyType> getBalance() async {
    final response = await _client.query(MarketplaceDocuments.getBalance);
    _catchQueryError(response);
    return MoneyType(double.parse(response['data']['viewer']['balance'].toString()));
  }

  @override
  Future<List<OfferEntity>> listOffers() async {
    final response = await _client.query(MarketplaceDocuments.listOffers);
    _catchQueryError(response);
    return _offerMapper.fromMapList(response['data']['viewer']['offers']);
  }

  void _catchQueryError(Map? response) {
    if (response == null) throw NullServerResponseFailure();
    final failure = ServerFailure.fromQueryResponse(response);
    if (failure != null) throw failure;
  }

  void _catchMutationError(Map? response) {
    if (response == null) throw NullServerResponseFailure();
    final failure = ServerFailure.fromMutationResponse(response);
    if (failure != null) throw failure;
  }
}
