import 'package:dio/dio.dart';
import 'package:jokes_api_client/src/models/joke_model.dart';
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
    try {
      final finalUrl =
          '$baseUrl${category.text}?lang=${language.name}&type=${type.name}';

      final response = await _client.get<Json>(finalUrl);

      if (response.statusCode == 200) {
        final dataResponse = response.data ?? {};

        final joke = JokeModel.fromJson(dataResponse);

        return Successful(joke);
      }

      throw ServerException(message: 'Server error: ${response.statusCode}');
    } catch (error) {
      final message = switch (error) {
        FormatException(message: final message) => message,
        ServerException(message: final message) => message,
        _ => 'Unexpected error: $error'
      };

      return Unsuccessful(Failure(message: message));
    }
  }
}
