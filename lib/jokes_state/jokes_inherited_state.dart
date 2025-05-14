part of 'jokes_inherited_widget.dart';

// State class to hold all the state variables and methods
class JokesInheritedState extends ChangeNotifier {
  JokesInheritedState({required JokesRepository jokesRepository})
      : _jokesRepository = jokesRepository;

  /// API jokes repository
  final JokesRepository _jokesRepository;

  // Initial state
  JokeCategory _category = JokeCategory.any;
  JokeLanguage _language = JokeLanguage.en;
  JokeType _type = JokeType.single;
  // Reactive states based on API requests
  JokesState _jokesState = JokesInitialState();

  // Getters for state variables
  JokeCategory get category => _category;
  JokeLanguage get language => _language;
  JokeType get type => _type;
  JokesState get jokesState => _jokesState;

  /// Updates the category
  void setCategory(JokeCategory category) {
    _category = category;
    notifyListeners();
  }

  /// Updates the language
  void setLanguage(JokeLanguage language) {
    _language = language;
    notifyListeners();
  }

  /// Updates the type
  void setType(JokeType type) {
    _type = type;
    notifyListeners();
  }

  /// Changes the new state
  void _changeJokesState({required JokesState newState}) {
    _jokesState = newState;
    notifyListeners();
  }

  // Method to get a joke and update the state
  Future<void> getJoke() async {
    _changeJokesState(newState: JokesLoadingState());

    final result = await _jokesRepository.getJoke(
      category: _category,
      language: _language,
      type: _type,
    );

    switch (result) {
      case Successful(value: final joke):
        {
          _changeJokesState(newState: JokesSuccessState(joke: joke));
        }
      case Unsuccessful(value: final failure):
        {
          _changeJokesState(
            newState: JokesErrorState(message: failure.message),
          );
        }
    }
  }
}
