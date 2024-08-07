/// {@template failure}
/// A [Failure] object that contains
/// a meessage with error description.
/// {@endtemplate}
class Failure implements Exception {
  /// {@macro failure}
  Failure({required this.message});

  /// Failure message description
  final String message;
}
