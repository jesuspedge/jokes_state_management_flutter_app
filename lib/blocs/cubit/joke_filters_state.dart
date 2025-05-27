part of 'joke_filters_cubit.dart';

/// Handle filter states
final class JokeFiltersState {
  JokeFiltersState({
    required this.category,
    required this.language,
    required this.type,
  });

  final JokeCategory category;
  final JokeLanguage language;
  final JokeType type;

  /// Create new states values
  JokeFiltersState copyWith({
    JokeCategory? category,
    JokeLanguage? language,
    JokeType? type,
  }) =>
      JokeFiltersState(
        category: category ?? this.category,
        language: language ?? this.language,
        type: type ?? this.type,
      );
}
