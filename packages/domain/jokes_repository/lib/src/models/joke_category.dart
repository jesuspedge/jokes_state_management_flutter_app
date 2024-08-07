/// {@template joke_category}
/// `Joke Category` item.
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
