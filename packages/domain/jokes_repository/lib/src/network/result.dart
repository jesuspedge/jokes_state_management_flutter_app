/// {@template result}
/// A [Result] abstract class.
/// {@endtemplate}
sealed class Result<T, E> {}

/// {@template successful}
/// A [Successful] class when network request
/// has valid data.
/// {@endtemplate}
class Successful<T, E> extends Result<T, E> {
  /// {@macro succesful}
  Successful({required this.value});

  /// Value returned
  final T value;
}

/// {@template unsuccessful}
/// A [Unsuccessful] class when network request
/// goes wrong.
/// {@endtemplate}
class Unsuccessful<T, E> extends Result<T, E> {
  /// {@macro unsuccesful}
  Unsuccessful({required this.value});

  /// Value returned
  final E value;
}
