import 'package:dio/dio.dart';
import 'package:jokes_api_client/src/typedefs.dart';
import 'package:jokes_repository/jokes_repository.dart';

/// {@template jokes_api_client}
/// A Flutter implementation of Jokes Repository that gets data from internet.
/// {@endtemplate}
class JokesApiClient implements JokesRepository {
  /// {@macro jokes_api_client}
  const JokesApiClient({required Dio client}) : _client = client;

  /// Remote client
  final Dio _client;

  /// Base url
  static const baseUrl = 'https://v2.jokeapi.dev/joke/';

  @override
  Future<Result<Joke, Failure>> getJoke({
    required JokeCategory category,
    required JokeLanguage language,
    required JokeType type,
  }) async {
    final finalUrl =
        '$baseUrl${category.text}?lang=${language.name}&type=${type.name}';

    final result = await _client.get<Json>(finalUrl);

    if (result.statusCode == 200) {}

    return Unsuccessful(Failure(message: 'Server error'));
  }
}
