class MarketplaceGetBalanceMock {
  static const successResponse = <String, dynamic>{
    "data": {
      "viewer": {"balance": 1000000}
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
