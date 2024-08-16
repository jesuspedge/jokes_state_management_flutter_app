import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:jokes_api_client/src/models/joke_model.dart';
import 'package:jokes_api_client/src/typedefs.dart';
import 'package:jokes_repository/jokes_repository.dart';

import 'fakes/fakes.dart';
import 'fixtures/fixture_reader.dart';

void main() {
  test('Is a subclass of Joke entity', () {
    /// asert
    expect(fakeSingleJokeModel, isA<Joke>());
    expect(fakeTwoPartsJokeModel, isA<Joke>());
  });

  group('from Json', () {
    test('Returns a single joke model', () {
      /// arrange
      final jsonSingleJoke =
          jsonDecode(fixture(name: 'single_joke.json')) as Json;

      /// act
      final singleJoke = JokeModel.fromJson(jsonSingleJoke);

      /// assert
      expect(singleJoke, fakeSingleJokeModel);
    });

    test('Returns a two parts joke model', () {
      /// arrange
      final jsonTwoPartsJoke =
          jsonDecode(fixture(name: 'twopart_joke.json')) as Json;

      /// act
      final twoPartsJoke = JokeModel.fromJson(jsonTwoPartsJoke);

      /// assert
      expect(twoPartsJoke, fakeTwoPartsJokeModel);
    });
  });
}
