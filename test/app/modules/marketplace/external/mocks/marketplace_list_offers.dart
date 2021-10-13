import 'package:nuconta_marketplace/app/modules/marketplace/domain/entities/offer_entity.dart';

class MarketplaceListOffersMock {
  static const successEntitiesResponse = [
    OfferEntity(id: 'mock-id-1', name: 'mock-name-1', price: 1000, description: 'mock-description-1', imageUrl: 'mock-image-1'),
    OfferEntity(id: 'mock-id-2', name: 'mock-name-2', price: 2000, description: 'mock-description-2', imageUrl: 'mock-image-2'),
    OfferEntity(id: 'mock-id-3', name: 'mock-name-3', price: 3000, description: 'mock-description-3', imageUrl: 'mock-image-3'),
  ];
  static const successResponse = <String, dynamic>{
    "data": {
      "viewer": {
        "offers": [
          {
            "id": "mock-id-1",
            "price": 1000,
            "product": {"name": "mock-name-1", "description": "mock-description-1", "image": "mock-image-1"}
          },
          {
            "id": "mock-id-2",
            "price": 2000,
            "product": {"name": "mock-name-2", "description": "mock-description-2", "image": "mock-image-2"}
          },
          {
            "id": "mock-id-3",
            "price": 3000,
            "product": {"name": "mock-name-3", "description": "mock-description-3", "image": "mock-image-3"}
          },
        ]
      }
    }
  };

  static const failureResponse = <String, dynamic>{
    "data": {"viewer": null},
    "errors": [
      {
        "message": "Unauthorized",
        "locations": [
          {"line": 2, "column": 3}
        ],
        "path": ["viewer"]
      }
    ]
  };

  static const nullResponse = null;
}
