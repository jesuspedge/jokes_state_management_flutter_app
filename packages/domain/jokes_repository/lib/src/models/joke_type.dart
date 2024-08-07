/// {@template joke_tye}
/// `Joke Type` item.
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
