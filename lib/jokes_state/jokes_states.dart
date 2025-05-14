part of 'jokes_inherited_widget.dart';

/// Request states for reacting based
/// on API responses.
sealed class JokesState {}

final class JokesInitialState extends JokesState {}

final class JokesLoadingState extends JokesState {}

final class JokesSuccessState extends JokesState {
  JokesSuccessState({required this.joke});

  final Joke joke;
}

final class JokesErrorState extends JokesState {
  JokesErrorState({required this.message});

  final String message;
}
