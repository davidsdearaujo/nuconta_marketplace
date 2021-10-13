class MarketplaceDocuments {
  static const getBalance = r'query getBalance { viewer { balance } }';
  static const buyOffer = r'''mutation buy_product($offerId: ID!) {
    purchase(offerId: $offerId)  { success errorMessage }
  }''';
  static const listOffers = r'''query list_offers {
    viewer {
      offers {
        id
        price
        product { id name description image }
      }
    }
  }''';
}
