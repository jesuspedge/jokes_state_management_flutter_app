import 'package:jokes_api_client/src/models/joke_model.dart';
import 'package:jokes_repository/jokes_repository.dart';

final fakeSingleJokeModel = JokeModel(
  type: JokeType.single,
  joke:
      // ignore: lines_longer_than_80_chars
      'A perfectionist walked into a bar... apparently, the bar was not set high enough.',
  setup: '',
  delivery: '',
);

final fakeTwoPartsJokeModel = JokeModel(
  type: JokeType.twopart,
  joke: '',
  setup: 'What kind of doctor is Dr. Pepper?',
  delivery: "He's a fizzician.",
);
