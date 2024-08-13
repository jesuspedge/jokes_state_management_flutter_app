/// {@template server_exception}
/// A [ServerException] object that contains
/// a meessage with error description.
/// {@endtemplate}
class ServerException implements Exception {
  /// {@macro server_exception}
  ServerException({required this.message});

  /// Error message
  final String message;
}
