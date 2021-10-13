class MarketplaceBuyOfferMock {
  static const successResponse = <String, dynamic>{
    "data": {
      "purchase": {
        "success": true,
        "errorMessage": null,
        "customer": {"balance": 995000}
      }
    }
  };

  static const failureResponse = <String, dynamic>{
    "data": {
      "purchase": {
        "success": false,
        "errorMessage": "Offer expired",
        "customer": {"balance": 1000000}
      }
    }
  };

  static const nullResponse = <String, dynamic>{
    "data": {"purchase": null}
  };
}
