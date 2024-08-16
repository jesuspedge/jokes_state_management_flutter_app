// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:jokes_api_client/src/jokes_api_client.dart';
import 'package:jokes_repository/jokes_repository.dart';
import 'package:mocktail/mocktail.dart';

import 'fakes/fakes.dart';

class MockApiClient extends Mock implements JokesApiClient {}

void main() {
  late MockApiClient mockApiClient;

  setUp(() {
    mockApiClient = MockApiClient();
  });

  group('JokesApiClient', () {
    group('returns a joke', () {
      final anyCategory = JokeCategory.values
          .elementAt(Random().nextInt(JokeCategory.values.length));

      final anyLanguage = JokeLanguage.values
          .elementAt(Random().nextInt(JokeLanguage.values.length));
      test('Returns a single joke', () async {
        /// arrange
        when(
          () => mockApiClient.getJoke(
            category: anyCategory,
            language: anyLanguage,
            type: JokeType.single,
          ),
        ).thenAnswer((_) async => Successful(value: fakeSingleJokeModel));

        // act
        final result = await mockApiClient.getJoke(
          category: anyCategory,
          language: anyLanguage,
          type: JokeType.single,
        );

        // assert
        expect(result, isA<Successful<Joke, Failure>>());
        expect((result as Successful).value, fakeSingleJokeModel);
      });

      test('Returns a two parts joke', () async {
        /// arrange
        when(
          () => mockApiClient.getJoke(
            category: anyCategory,
            language: anyLanguage,
            type: JokeType.twopart,
          ),
        ).thenAnswer((_) async => Successful(value: fakeTwoPartsJokeModel));

        // act
        final result = await mockApiClient.getJoke(
          category: anyCategory,
          language: anyLanguage,
          type: JokeType.twopart,
        );

        // assert
        expect(result, isA<Successful<Joke, Failure>>());
        expect((result as Successful).value, fakeTwoPartsJokeModel);
      });
    });

    group('Returns a error', () {
      final anyCategory = JokeCategory.values
          .elementAt(Random().nextInt(JokeCategory.values.length));

      final anyLanguage = JokeLanguage.values
          .elementAt(Random().nextInt(JokeLanguage.values.length));

      final anyType =
          JokeType.values.elementAt(Random().nextInt(JokeType.values.length));

      final mockFailure = Failure(message: 'Error');
      test('returns a failure', () async {
        /// arrange
        when(
          () => mockApiClient.getJoke(
            category: anyCategory,
            language: anyLanguage,
            type: anyType,
          ),
        ).thenAnswer(
          (_) async => Unsuccessful(value: mockFailure),
        );

        // act
        final result = await mockApiClient.getJoke(
          category: anyCategory,
          language: anyLanguage,
          type: anyType,
        );

        // assert
        expect(result, isA<Unsuccessful<Joke, Failure>>());
        expect((result as Unsuccessful).value, mockFailure);
      });
    });
  });
}
