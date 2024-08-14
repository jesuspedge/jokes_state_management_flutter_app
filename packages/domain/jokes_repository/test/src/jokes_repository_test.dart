// ignore_for_file: prefer_const_constructors
import 'dart:math';

import 'package:jokes_repository/jokes_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'models/joke_mock_model.dart';

class MockJokesRepository extends Mock implements JokesRepository {}

void main() {
  late MockJokesRepository mockJokesRepository;

  setUp(() {
    mockJokesRepository = MockJokesRepository();
  });

  group('Jokes Repository', () {
    group('returns joke with', () {
      final Joke testJoke = JokeMockModel(
        type: JokeType.single,
        joke: '',
        setup: '',
        delivery: '',
      );
      final Joke singleTestJoke = JokeMockModel(
        type: JokeType.single,
        joke: 'joke',
        setup: '',
        delivery: '',
      );
      final Joke twopartsTestJoke = JokeMockModel(
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
        ).thenAnswer((_) async => Successful(value: testJoke));

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
        ).thenAnswer((_) async => Successful(value: testJoke));

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
        ).thenAnswer((_) async => Successful(value: singleTestJoke));

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
        ).thenAnswer((_) async => Successful(value: twopartsTestJoke));

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

    group('returns failure with fail message', () {
      final testFailure = Failure(message: 'error');

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
        ).thenAnswer((_) async => Unsuccessful(value: testFailure));

        // act
        final result = await mockJokesRepository.getJoke(
          category: category,
          language: JokeLanguage.en,
          type: JokeType.single,
        );

        // assert
        expect(result, isA<Unsuccessful<Joke, Failure>>());
        expect((result as Unsuccessful).value, testFailure);
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
        ).thenAnswer((_) async => Unsuccessful(value: testFailure));

        // act
        final result = await mockJokesRepository.getJoke(
          category: JokeCategory.any,
          language: language,
          type: JokeType.single,
        );

        // assert
        expect(result, isA<Unsuccessful<Joke, Failure>>());
        expect((result as Unsuccessful).value, testFailure);
      });

      test('random type parameter', () async {
        // arrange
        final type =
            JokeType.values.elementAt(Random().nextInt(JokeType.values.length));
        when(
          () => mockJokesRepository.getJoke(
            category: JokeCategory.any,
            language: JokeLanguage.en,
            type: type,
          ),
        ).thenAnswer((_) async => Unsuccessful(value: testFailure));

        // act
        final result = await mockJokesRepository.getJoke(
          category: JokeCategory.any,
          language: JokeLanguage.en,
          type: type,
        );

        // assert
        expect(result, isA<Unsuccessful<Joke, Failure>>());
        expect((result as Unsuccessful).value, testFailure);
      });
    });
  });
}
