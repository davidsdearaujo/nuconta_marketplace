import 'package:nuconta_marketplace/app/modules/core/clean_architecture/failure.dart';

class InternalFailure extends Failure {
  InternalFailure(Object exception, StackTrace stacktrace)
      : super(
            code: 'internal-failure',
            message: 'An internal error has occurred, please try again. If the problem persists, contact your system administrator',
            exception: exception,
            stacktrace: stacktrace);
}
