part of 'joke_filters_provider.dart';

/// Class to manage the joke filters state
class _JokeFiltersState extends StateNotifier<FiltersState> {
  _JokeFiltersState()
      : super(
          FiltersState(
            category: JokeCategory.any,
            language: JokeLanguage.en,
            type: JokeType.single,
          ),
        );

  /// Updates the state with new category
  void updateCategory({required JokeCategory newCategory}) =>
      state = state.copyWith(category: newCategory);

  /// Updates the state with new language
  void updateLanguage({required JokeLanguage newLanguage}) =>
      state = state.copyWith(language: newLanguage);

  /// Updates the state with new type
  void updateType({required JokeType newType}) =>
      state = state.copyWith(type: newType);
}

/// Filters state class
final class FiltersState {
  FiltersState({
    required this.category,
    required this.language,
    required this.type,
  });

  final JokeCategory category;
  final JokeLanguage language;
  final JokeType type;

  /// Create new states values
  FiltersState copyWith({
    JokeCategory? category,
    JokeLanguage? language,
    JokeType? type,
  }) =>
      FiltersState(
        category: category ?? this.category,
        language: language ?? this.language,
        type: type ?? this.type,
      );
}
