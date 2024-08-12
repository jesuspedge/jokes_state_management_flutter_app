import 'package:jokes_repository/jokes_repository.dart';

/// {@template joke_model}
/// A modelimplementation of Joke.
/// {@endtemplate}
class JokeModel extends Joke {
  /// {@macro joke_model}
  JokeModel({
    required super.type,
    required super.joke,
    required super.setup,
    required super.delivery,
  });
}
