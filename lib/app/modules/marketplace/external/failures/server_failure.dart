import 'package:nuconta_marketplace/app/modules/core/core_module.dart';

class ServerFailure extends Failure {
  final Map response;
  const ServerFailure(String message, this.response) : super(code: 'server-failure', message: message);

  static ServerFailure? fromQueryResponse(Map response) {
    if (response['errors'] == null) return null;
    if (response['errors'] is! List) return null;
    final List errors = response['errors'];
    if (errors.isEmpty) return null;
    return ServerFailure(errors.first['message'], response);
  }

  static ServerFailure? fromMutationResponse(Map response) {
    if (response['success'] == true) return null;
    if (response.containsKey('errorMessage') == false) return null;
    if (response['errorMessage'] == null) return null;
    return ServerFailure(response['errorMessage'], response);
  }
}
