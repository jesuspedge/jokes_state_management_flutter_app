part of 'jokes_bloc.dart';

@immutable
sealed class JokesEvent {}

// Get joke event trigered at press get joke button
final class GetJoke extends JokesEvent {
  GetJoke({required this.language, required this.category, required this.type});

  final JokeLanguage language;
  final JokeCategory category;
  final JokeType type;
}
