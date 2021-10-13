import 'package:nuconta_marketplace/app/modules/core/core_module.dart';

import '../../marketplace_module.dart';

class OfferMapper extends Mapper<OfferEntity> {
  const OfferMapper();

  @override
  Map toMap(OfferEntity entity) {
    return {
      'id': entity.id,
      'price': entity.price.value,
      'product': {
        'name': entity.name,
        'description': entity.description,
        'image': entity.imageUrl,
      }
    };
  }

  @override
  OfferEntity fromMap(Map map) {
    return OfferEntity(
      id: map['id'],
      price: MoneyType(double.parse(map['price'].toString())),
      name: map['product']['name'],
      description: map['product']['description'],
      imageUrl: map['product']['image'],
    );
  }
}
