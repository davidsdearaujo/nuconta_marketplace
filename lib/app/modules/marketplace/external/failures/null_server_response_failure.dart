import 'package:nuconta_marketplace/app/modules/core/core_module.dart';

class NullServerResponseFailure extends Failure {
  NullServerResponseFailure() : super(code: 'null-server-response', message: null);
}
