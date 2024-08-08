// ignore_for_file: prefer_const_constructors
import 'dart:math';

import 'package:jokes_repository/jokes_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'models/joke_model.dart';

class MockJokesRepository extends Mock implements JokesRepository {}

void main() {
  late MockJokesRepository mockJokesRepository;

  setUp(() {
    mockJokesRepository = MockJokesRepository();
  });

  group('Jokes Repository', () {
    group('returns joke with', () {
      final Joke testJoke =
          JokeModel(type: JokeType.single, joke: '', setup: '', delivery: '');
      final Joke singleTestJoke = JokeModel(
        type: JokeType.single,
        joke: 'joke',
        setup: '',
        delivery: '',
      );
      final Joke twopartsTestJoke = JokeModel(
        type: JokeType.twopart,
        joke: '',
        setup: 'joke',
        delivery: 'joke',
      );

      test('random category parameter', () async {
        // arrange
        final category = JokeCategory.values
            .elementAt(Random().nextInt(JokeCategory.values.length));
        when(
          () => mockJokesRepository.getJoke(
            category: category,
            language: JokeLanguage.en,
            type: JokeType.single,
          ),
        ).thenAnswer((_) async => Successful(testJoke));

        // act
        final result = await mockJokesRepository.getJoke(
          category: category,
          language: JokeLanguage.en,
          type: JokeType.single,
        );

        // assert
        expect(result, isA<Successful<Joke, Failure>>());
        expect((result as Successful).value, testJoke);
      });

      test('random language parameter', () async {
        // arrange
        final language = JokeLanguage.values
            .elementAt(Random().nextInt(JokeLanguage.values.length));
        when(
          () => mockJokesRepository.getJoke(
            category: JokeCategory.any,
            language: language,
            type: JokeType.single,
          ),
        ).thenAnswer((_) async => Successful(testJoke));

        // act
        final result = await mockJokesRepository.getJoke(
          category: JokeCategory.any,
          language: language,
          type: JokeType.single,
        );

        // assert
        expect(result, isA<Successful<Joke, Failure>>());
        expect((result as Successful).value, testJoke);
      });

      test('single joke parameter', () async {
        // arrange
        when(
          () => mockJokesRepository.getJoke(
            category: JokeCategory.any,
            language: JokeLanguage.en,
            type: JokeType.single,
          ),
        ).thenAnswer((_) async => Successful(singleTestJoke));

        // act
        final result = await mockJokesRepository.getJoke(
          category: JokeCategory.any,
          language: JokeLanguage.en,
          type: JokeType.single,
        );

        // assert
        expect(result, isA<Successful<Joke, Failure>>());
        expect((result as Successful).value, singleTestJoke);
      });

      test('two parts joke parameter', () async {
        // arrange
        when(
          () => mockJokesRepository.getJoke(
            category: JokeCategory.any,
            language: JokeLanguage.en,
            type: JokeType.twopart,
          ),
        ).thenAnswer((_) async => Successful(twopartsTestJoke));

        // act
        final result = await mockJokesRepository.getJoke(
          category: JokeCategory.any,
          language: JokeLanguage.en,
          type: JokeType.twopart,
        );

        // assert
        expect(result, isA<Successful<Joke, Failure>>());
        expect((result as Successful).value, twopartsTestJoke);
      });
    });
  });
}
