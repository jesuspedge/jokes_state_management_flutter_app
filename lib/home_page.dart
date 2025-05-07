import 'package:flutter/material.dart';
import 'package:jokes_app/widgets/widgets.dart';
import 'package:jokes_repository/jokes_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    required JokesRepository jokesRepository,
    super.key,
  }) : _jokesRepository = jokesRepository;

  final JokesRepository _jokesRepository;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  JokeCategory _category = JokeCategory.any;
  JokeLanguage _language = JokeLanguage.en;
  JokeType _type = JokeType.single;
  Widget childJokesContainer = const NoJokeWidget();

  void _changeJokeContainerWidget({required Widget newWidget}) =>
      setState(() => childJokesContainer = newWidget);

  Future<void> _getJoke() async {
    _changeJokeContainerWidget(newWidget: const LoadingWidget());

    final result = await widget._jokesRepository
        .getJoke(category: _category, language: _language, type: _type);

    switch (result) {
      case Successful(value: final joke):
        {
          _changeJokeContainerWidget(newWidget: JokeWidget(joke: joke));
        }
      case Unsuccessful(value: final failure):
        {
          _changeJokeContainerWidget(
            newWidget: ErrorJokeWidget(text: failure.message),
          );
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleMedium;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Jokes App'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Column(
            spacing: 20,
            children: [
              Wrap(
                spacing: size.width * 0.1,
                runSpacing: 10,
                children: [
                  Column(
                    spacing: 5,
                    children: [
                      Text('Language:  ', style: textStyle),
                      LanguageFilter(
                        value: _language,
                        onChanged: (newValue) => setState(
                          () => _language = newValue ?? JokeLanguage.en,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    spacing: 5,
                    children: [
                      Text('Category:  ', style: textStyle),
                      CategoryFilter(
                        value: _category,
                        onChanged: (newValue) => setState(
                          () => _category = newValue ?? JokeCategory.any,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    spacing: 5,
                    children: [
                      Text('Type:  ', style: textStyle),
                      TypeFilter(
                        value: _type,
                        onChanged: (newValue) =>
                            setState(() => _type = newValue ?? JokeType.single),
                      ),
                    ],
                  ),
                  
                ],
              ),
              JokesContainer(
                child: childJokesContainer,
              ),
              GetJokeButton(
                onPressed: _getJoke,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
