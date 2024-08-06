/// {@template todo_item}
/// A single `Joke` item.
/// {@endtemplate}
abstract class Joke {
  /// {@macro joke_item}
  const Joke({
    required this.type,
    required this.joke,
    required this.setup,
    required this.delivery,
  });

  /// Joke type
  final JokeType type;

  /// String joke for single
  /// type
  final String joke;

  /// String setup part for
  /// two part joke
  final String setup;

  /// String delivery part for
  /// two part joke
  final String delivery;
}

/// {@template todo_item}
/// `Joke Category` items.
/// {@endtemplate}
enum JokeCategory {
  /// Any
  any('Any'),

  /// Programming
  programming('Programming'),

  /// Misc
  misc('Misc'),

  /// Dark
  dark('Dark'),

  /// Pun
  pun('Pun'),

  /// Spooky
  spooky('Spooky'),

  /// Christmas
  christmas('Christmas');

  const JokeCategory(this.text);

  /// Api text
  final String text;
}

/// {@template todo_item}
/// `Joke Language` items.
/// {@endtemplate}
enum JokeLanguage {
  /// Czech
  cs('Czech'),

  /// German
  de('German'),

  /// English
  en('English'),

  /// Spanish
  es('Spanish'),

  /// French
  fr('French'),

  /// Portuguese
  pt('Portuguese');

  const JokeLanguage(this.text);

  /// Api text
  final String text;
}

/// {@template todo_item}
/// `Joke Type` items.
/// {@endtemplate}
enum JokeType {
  /// Single
  single('Single'),

  /// Two Part
  twopart('Two part');

  const JokeType(this.text);

  /// Api text
  final String text;
}
