abstract class Failure {
  final String code;
  final String message;
  final Object? exception;
  final StackTrace? stacktrace;
  const Failure({required this.code, required this.message, this.exception, this.stacktrace});
}
