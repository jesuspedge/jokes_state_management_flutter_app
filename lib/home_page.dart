import 'package:flutter/material.dart';
import 'package:jokes_app/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
