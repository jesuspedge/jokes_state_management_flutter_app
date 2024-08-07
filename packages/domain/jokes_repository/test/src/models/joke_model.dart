import 'package:jokes_repository/jokes_repository.dart';

class JokeModel extends Joke {
  JokeModel({
    required super.type,
    required super.joke,
    required super.setup,
    required super.delivery,
  });
}
