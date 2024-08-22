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

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleMedium;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Jokes App'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Column(
            children: [
              Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(
                    children: [
                      Text('Language:', style: textStyle),
                      LanguageFilter(
                        value: _language,
                        onChanged: (newValue) => setState(
                          () => _language = newValue ?? JokeLanguage.en,
                        ),
                      ),
                    ],
                  ),
                  const TableRow(
                    children: [
                      SizedBox(height: 10),
                      SizedBox(height: 10),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text('Category:', style: textStyle),
                      CategoryFilter(
                        value: _category,
                        onChanged: (newValue) => setState(
                          () => _category = newValue ?? JokeCategory.any,
                        ),
                      ),
                    ],
                  ),
                  const TableRow(
                    children: [
                      SizedBox(height: 10),
                      SizedBox(height: 10),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text('Type:', style: textStyle),
                      TypeFilter(
                        value: _type,
                        onChanged: (newValue) =>
                            setState(() => _type = newValue ?? JokeType.single),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const JokesContainer(),
              const SizedBox(height: 20),
              GetJokeButton(
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
