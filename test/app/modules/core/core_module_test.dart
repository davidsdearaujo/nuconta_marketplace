import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nuconta_marketplace/app/modules/core/core_module.dart';
 
void main() {
test('zsa', () async {
final client = HasuraConnect(
        'https://staging-nu-needful-things.nubank.com.br/query',
        headers: {'Authorization':'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhd2Vzb21lY3VzdG9tZXJAZ21haWwuY29tIn0.cGT2KqtmT8KNIJhyww3T8fAzUsCD5_vxuHl5WbXtp8c'},
      );
      const doc = r'''query list_offers {
  viewer {
    id
    name
    balance
    offers {
      id
      price
      product {
        id
        name
        description
        image
      }
    }
  }
}''';
      final response = await client.query(doc);
      print(response);
});
  // setUpAll(() {
  //   initModule(CoreModule());
  // });
}