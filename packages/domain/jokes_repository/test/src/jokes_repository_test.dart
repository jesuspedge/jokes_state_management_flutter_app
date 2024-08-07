// ignore_for_file: prefer_const_constructors
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
    group('returns single joke with', () {
      final Joke testJoke =
          JokeModel(type: JokeType.single, joke: '', setup: '', delivery: '');
      test('any category parameter', () async {
        // arrange
        when(
          () => mockJokesRepository.getJoke(
            category: JokeCategory.any,
            language: JokeLanguage.en,
            type: JokeType.single,
          ),
        ).thenAnswer((_) async => Successful(testJoke));

        // act
        final result = await mockJokesRepository.getJoke(
          category: JokeCategory.any,
          language: JokeLanguage.en,
          type: JokeType.single,
        );

        // assert
        expect(result, Successful<Joke, Failure>(testJoke));
        verifyNoMoreInteractions(mockJokesRepository);
      });
    });
  });
}
