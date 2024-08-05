/// {@template jokes_repository}
/// A repository that handles jokes requests.
/// {@endtemplate}
abstract class JokesRepository {
  /// {@macro jokes_repository}
  const JokesRepository();

  /// Gets a [Joke].
  ///
  /// If a something goes wrong retunr a [Failure].
}
