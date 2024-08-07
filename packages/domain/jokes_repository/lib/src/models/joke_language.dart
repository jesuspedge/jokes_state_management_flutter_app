/// {@template joke_language}
/// `Joke Language` item.
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
