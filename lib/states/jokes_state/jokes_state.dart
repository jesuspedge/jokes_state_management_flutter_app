part of 'jokes_provider.dart';

class JokesState extends AsyncNotifier<Joke?> {
  JokesState({required JokesRepository jokesRepository})
      : _jokesRepository = jokesRepository;

  /// Access to injected dependency repository
  final JokesRepository _jokesRepository;

  // Initial joke value
  @override
  FutureOr<Joke?> build() => null;

  // Get new joke based on filters
  Future<void> getJoke({
    required JokeCategory category,
    required JokeLanguage language,
    required JokeType type,
  }) async {
    // Loading
    state = const AsyncValue.loading();

    final result = await _jokesRepository.getJoke(
      category: category,
      language: language,
      type: type,
    );

    switch (result) {
      case Successful(value: final joke):
        { 
          // Success
          state = AsyncValue.data(joke);
        }
      case Unsuccessful(value: final failure):
        { 
          // Error
          state = AsyncValue.error(failure, StackTrace.current);
        }
    }
  }
}
