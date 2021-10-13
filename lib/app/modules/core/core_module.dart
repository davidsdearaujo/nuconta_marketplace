import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';

//Services exports
export 'package:hasura_connect/hasura_connect.dart';

//Clean Architecture exports
export 'clean_architecture/failure.dart';
export 'clean_architecture/mapper.dart';

class CoreModule extends Module {
  @override
  List<Bind<Object>> binds = [
    Bind.lazySingleton(
      (i) => HasuraConnect(
        'https://staging-nu-needful-things.nubank.com.br/query',
        headers: {'token':'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhd2Vzb21lY3VzdG9tZXJAZ21haWwuY29tIn0.cGT2KqtmT8KNIJhyww3T8fAzUsCD5_vxuHl5WbXtp8c'},
      ),
      export: true,
    ),
  ];
}
