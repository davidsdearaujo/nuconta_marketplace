import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nuconta_marketplace/app/modules/core/core_module.dart';
import 'package:nuconta_marketplace/app/modules/marketplace/external/datasources/marketplace_datasource.dart';
import 'package:nuconta_marketplace/app/modules/marketplace/external/failures/null_server_response_failure.dart';
import 'package:nuconta_marketplace/app/modules/marketplace/external/failures/server_failure.dart';
import 'package:nuconta_marketplace/app/modules/marketplace/external/graphql/marketplace_documents.dart';
import 'package:nuconta_marketplace/app/modules/marketplace/external/mappers/offer_mapper.dart';

import '../mocks/marketplace_buy_offer.dart';
import '../mocks/marketplace_get_balance.dart';
import '../mocks/marketplace_list_offers.dart';

class MockHasuraConnect extends Mock implements HasuraConnect {}

class MockOfferMapper extends Mock implements OfferMapper {}

void main() {
  late MarketplaceDatasource datasource;
  late MockHasuraConnect client;
  late MockOfferMapper offerMapper;

  setUp(() {
    client = MockHasuraConnect();
    offerMapper = MockOfferMapper();
    datasource = MarketplaceDatasource(client, offerMapper);
  });
  group('buyOffer -', () {
    test('success', () {
      const mockOfferId = 'mock-offer-id';
      when(() => client.mutation(MarketplaceDocuments.buyOffer, variables: {'offerId': mockOfferId}))
          .thenAnswer((invocation) async => MarketplaceBuyOfferMock.successResponse);
      final future = datasource.buyOffer(mockOfferId);

      expect(future, completes);
      verify(() => client.mutation(MarketplaceDocuments.buyOffer, variables: {'offerId': mockOfferId})).called(1);
      verifyZeroInteractions(offerMapper);
    });

    test('server failure', () {
      const mockOfferId = 'mock-offer-id';
      final expectedFailure = ServerFailure.fromMutationResponse(MarketplaceBuyOfferMock.failureResponse['data']['purchase']);
      when(() => client.mutation(MarketplaceDocuments.buyOffer, variables: {'offerId': mockOfferId}))
          .thenAnswer((invocation) async => MarketplaceBuyOfferMock.failureResponse);
      final future = datasource.buyOffer(mockOfferId);

      expect(future, throwsA(expectedFailure));
      verify(() => client.mutation(MarketplaceDocuments.buyOffer, variables: {'offerId': mockOfferId})).called(1);
      verifyZeroInteractions(offerMapper);
    });

    test('null server response failure', () {
      const mockOfferId = 'mock-offer-id';
      final expectedFailure = NullServerResponseFailure();
      when(() => client.mutation(MarketplaceDocuments.buyOffer, variables: {'offerId': mockOfferId}))
          .thenAnswer((invocation) async => MarketplaceBuyOfferMock.nullResponse);
      final future = datasource.buyOffer(mockOfferId);

      expect(future, throwsA(expectedFailure));
      verify(() => client.mutation(MarketplaceDocuments.buyOffer, variables: {'offerId': mockOfferId})).called(1);
      verifyZeroInteractions(offerMapper);
    });
  });

  group('getBalance -', () {
    test('success', () {
      const double expectedResponse = 1000000;
      when(() => client.query(MarketplaceDocuments.getBalance)).thenAnswer((invocation) async => MarketplaceGetBalanceMock.successResponse);
      final future = datasource.getBalance();

      expect(future, completion((response) => response == expectedResponse));
      verify(() => client.query(MarketplaceDocuments.getBalance)).called(1);
      verifyZeroInteractions(offerMapper);
    });

    test('server failure', () {
      final expectedFailure = ServerFailure.fromQueryResponse(MarketplaceGetBalanceMock.failureResponse);
      when(() => client.query(MarketplaceDocuments.getBalance)).thenAnswer((invocation) async => MarketplaceGetBalanceMock.failureResponse);
      final future = datasource.getBalance();

      expect(future, throwsA(expectedFailure));
      verify(() => client.query(MarketplaceDocuments.getBalance)).called(1);
      verifyZeroInteractions(offerMapper);
    });

    test('null server response failure', () {
      final expectedFailure = NullServerResponseFailure();
      when(() => client.query(MarketplaceDocuments.getBalance)).thenAnswer((invocation) async => MarketplaceGetBalanceMock.nullResponse);
      final future = datasource.getBalance();

      expect(future, throwsA(expectedFailure));
      verify(() => client.query(MarketplaceDocuments.getBalance)).called(1);
      verifyZeroInteractions(offerMapper);
    });
  });

  group('listOffers -', () {
    test('success', () async {
      const expectedResponse = MarketplaceListOffersMock.successEntitiesResponse;
      when(() => offerMapper.fromMapList(MarketplaceListOffersMock.successResponse['data']['viewer']['offers']))
          .thenReturn(MarketplaceListOffersMock.successEntitiesResponse);
      when(() => client.query(MarketplaceDocuments.listOffers)).thenAnswer((invocation) async => MarketplaceListOffersMock.successResponse);
      final future = datasource.listOffers();

      expect(future, completion((response) => response == expectedResponse));
      await future;
      verify(() => client.query(MarketplaceDocuments.listOffers)).called(1);
      verify(() => offerMapper.fromMapList(MarketplaceListOffersMock.successResponse['data']['viewer']['offers'])).called(1);
    });

    test('server failure', () {
      final expectedFailure = ServerFailure.fromQueryResponse(MarketplaceListOffersMock.failureResponse);
      when(() => client.query(MarketplaceDocuments.listOffers)).thenAnswer((invocation) async => MarketplaceListOffersMock.failureResponse);
      final future = datasource.listOffers();

      expect(future, throwsA(expectedFailure));
      verify(() => client.query(MarketplaceDocuments.listOffers)).called(1);
      verifyZeroInteractions(offerMapper);
    });

    test('null server response failure', () {
      final expectedFailure = NullServerResponseFailure();
      when(() => client.query(MarketplaceDocuments.listOffers)).thenAnswer((invocation) async => MarketplaceListOffersMock.nullResponse);
      final future = datasource.listOffers();

      expect(future, throwsA(expectedFailure));
      verify(() => client.query(MarketplaceDocuments.listOffers)).called(1);
      verifyZeroInteractions(offerMapper);
    });
  });
}
