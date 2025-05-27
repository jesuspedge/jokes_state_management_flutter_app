import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokes_app/blocs/blocs.dart';
import 'package:jokes_app/widgets/widgets.dart';
import 'package:jokes_repository/jokes_repository.dart';

/// Bloc and cubit injection
class HomePage extends StatelessWidget {
  const HomePage({
    required JokesRepository jokesRepository,
    super.key,
  }) : _jokesRepository = jokesRepository;

  final JokesRepository _jokesRepository;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Jokes bloc
        BlocProvider(
          create: (context) => JokesBloc(jokesRepository: _jokesRepository),
        ),

        // Joke filters cubit
        BlocProvider(create: (context) => JokeFiltersCubit()),
      ],
      child: const HomeView(),
    );
  }
}

/// Main Home View
class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
                      const LanguageFilter(),
                    ],
                  ),
                  Column(
                    spacing: 5,
                    children: [
                      Text('Category:  ', style: textStyle),
                      const CategoryFilter(),
                    ],
                  ),
                  Column(
                    spacing: 5,
                    children: [
                      Text('Type:  ', style: textStyle),
                      const TypeFilter(),
                    ],
                  ),
                ],
              ),
              const JokesContainer(),
              const GetJokeButton(),
            ],
          ),
        ),
      ),
    );
  }
}
