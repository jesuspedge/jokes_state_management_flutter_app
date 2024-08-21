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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jokes App'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Column(
            children: [
              CategoryFilter(
                value: _category,
                onChanged: (newValue) =>
                    setState(() => _category = newValue ?? JokeCategory.any),
              ),
              const SizedBox(height: 20),
              const JokesContainer(),
              const SizedBox(height: 20),
              GetJokeButton(onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
