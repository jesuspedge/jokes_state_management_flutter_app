part of 'jokes_bloc.dart';

// Jokes container posible states

@immutable
sealed class JokesState {}

final class JokesInitial extends JokesState {}

final class JokesLoading extends JokesState {}

final class JokesSuccess extends JokesState {
  JokesSuccess({required this.joke});

  final Joke joke;
}

final class JokesError extends JokesState {
  JokesError({required this.message});

  final String message;
}
