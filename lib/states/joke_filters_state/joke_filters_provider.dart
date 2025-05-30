import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jokes_repository/jokes_repository.dart';

part 'joke_filters_state.dart';

/// Joke filters notifier provider
final jokeFiltersProvider =
    StateNotifierProvider<_JokeFiltersState, FiltersState>(
  (ref) => _JokeFiltersState(),
);
