import 'package:flutter_test/flutter_test.dart';
import 'package:nuconta_marketplace/app/modules/core/core_module.dart';
import 'package:nuconta_marketplace/app/modules/marketplace/external/mappers/offer_mapper.dart';
import 'package:nuconta_marketplace/app/modules/marketplace/marketplace_module.dart';

void main() {
  group('toMap', () {
    late Map data;
    setUp(() {
      data = const OfferMapper().toMap(
        const OfferEntity(
            id: 'mock-id', name: 'mock-name', price: MoneyType(50.5), description: 'mock-description', imageUrl: 'mock-image-url'),
      );
    });

    test('id', () => expect(data['id'], 'mock-id'));
    test('price', () => expect(data['price'], 50.5));
    test('name', () => expect(data['product']['name'], 'mock-name'));
    test('description', () => expect(data['product']['description'], 'mock-description'));
    test('image', () => expect(data['product']['image'], 'mock-image-url'));
  });
  group('fromMap', () {
    late OfferEntity data;
    setUp(() {
      data = const OfferMapper().fromMap({
        'id': 'mock-id',
        'price': 5000.4,
        'product': {'name': 'mock-name', 'description': 'mock-description', 'image': 'mock-image-url'}
      });
    });

    test('id', () => expect(data.id, 'mock-id'));
    test('price', () => expect(data.price, 5000.4));
    test('name', () => expect(data.name, 'mock-name'));
    test('description', () => expect(data.description, 'mock-description'));
    test('image', () => expect(data.imageUrl, 'mock-image-url'));
  });
}
