// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:jokes_api_client/src/jokes_api_client.dart';
import 'package:jokes_repository/jokes_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockApiClient extends Mock implements JokesApiClient {}

void main() {
  late MockApiClient mockApiClient;

  setUp(() {
    mockApiClient = MockApiClient();
  });

  group('JokesApiClient', () {
    group('returns a joke', () {
      test('single joke', () async {
        /// arrange
        when(
          () => mockApiClient.getJoke(
            category: JokeCategory.any,
            language: JokeLanguage.en,
            type: JokeType.single,
          ),
        );
      });
    });
  });
}
