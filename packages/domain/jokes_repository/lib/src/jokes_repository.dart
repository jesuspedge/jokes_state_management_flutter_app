import 'package:jokes_repository/jokes_repository.dart';

/// {@template jokes_repository}
/// A repository that handles jokes requests.
/// {@endtemplate}
// ignore: one_member_abstracts
abstract class JokesRepository {
  /// {@macro jokes_repository}
  const JokesRepository();

  /// Gets a [Joke].
  ///
  /// If a something goes wrong return a [Failure].
  Future<Result<Joke, Failure>> getJoke({
    required JokeCategory category,
    required JokeLanguage language,
    required JokeType type,
  });
}
