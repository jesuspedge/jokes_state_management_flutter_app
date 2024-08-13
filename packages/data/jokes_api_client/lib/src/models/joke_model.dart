import 'package:jokes_api_client/src/typedefs.dart';
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

  /// Parse [Json] to [Joke]
  factory JokeModel.fromJson(Json json) {
    switch (json) {
      /// Single joke type case
      case {
          'error': false,
          'type': final type,
          'joke': final joke,
        }:
        {
          if (type is String && joke is String) {
            return JokeModel(
              type: JokeType.values.firstWhere(
                (jokeType) => jokeType.name == type,
                orElse: () => JokeType.single,
              ),
              joke: joke,
              setup: '',
              delivery: '',
            );
          }
        }

      /// Two parts joke type case
      case {
          'error': false,
          'type': final type,
          'setup': final setup,
          'delivery': final delivery,
        }:
        {
          if (type is String && setup is String && delivery is String) {
            return JokeModel(
              type: JokeType.values.firstWhere(
                (jokeType) => jokeType.name == type,
                orElse: () => JokeType.single,
              ),
              joke: '',
              setup: setup,
              delivery: delivery,
            );
          }
        }

      /// Error case
      case {
          'error': true,
          'message': final message,
        }:
        {
          if (message is String) {
            throw ServerException(message: message);
          }
        }
    }

    throw const FormatException('Error parsing joke response');
  }
}
