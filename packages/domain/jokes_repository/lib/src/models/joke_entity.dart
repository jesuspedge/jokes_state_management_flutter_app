import 'package:jokes_repository/src/models/models.dart';

/// {@template joke_entity}
/// A single `Joke` item.
/// {@endtemplate}
abstract class Joke {
  /// {@macro joke_item}
  const Joke({
    required this.type,
    required this.joke,
    required this.setup,
    required this.delivery,
  });

  /// Joke type
  final JokeType type;

  /// String joke for single
  /// type
  final String joke;

  /// String setup part for
  /// two part joke
  final String setup;

  /// String delivery part for
  /// two part joke
  final String delivery;
}
