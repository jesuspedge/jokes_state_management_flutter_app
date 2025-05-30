import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jokes_app/states/states.dart';

class GetJokeButton extends ConsumerWidget {
  const GetJokeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {
        // final category = ref.read(categoryFilterProvider);
        // final language = ref.read(languageFilterProvider);
        // final type = ref.read(typeFilterProvider);
        final filtersState = ref.read(jokeFiltersProvider);

        ref.read(jokesProvider.notifier).getJoke(
              category: filtersState.category,
              language: filtersState.language,
              type: filtersState.type,
            );
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        side: BorderSide(color: Colors.white.withAlpha(75)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      child: const Text(
        'Get Joke',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
