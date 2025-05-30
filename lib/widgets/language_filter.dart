import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jokes_app/states/states.dart';
import 'package:jokes_repository/jokes_repository.dart';

class LanguageFilter extends ConsumerWidget {
  const LanguageFilter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch language filter state
    final language = ref.watch(jokeFiltersProvider).language;

    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white.withAlpha(75)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton<JokeLanguage>(
        onChanged: (languageSelected) {
          if(languageSelected != null) {
            ref
                .read(jokeFiltersProvider.notifier)
                .updateLanguage(newLanguage: languageSelected);
          }
        },
        value: language,
        items: JokeLanguage.values
            .map(
              (value) =>
                  DropdownMenuItem(value: value, child: Text(value.text)),
            )
            .toList(),
        elevation: 3,
        padding: const EdgeInsets.only(left: 10),
        underline: const DropdownButtonHideUnderline(child: SizedBox.shrink()),
      ),
    );
  }
}
