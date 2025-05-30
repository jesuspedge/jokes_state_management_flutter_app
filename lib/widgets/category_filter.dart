import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jokes_app/states/states.dart';
import 'package:jokes_repository/jokes_repository.dart';

class CategoryFilter extends ConsumerWidget {
  const CategoryFilter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch category filter state
    final category = ref.watch(jokeFiltersProvider).category;

    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white.withAlpha(75)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton<JokeCategory>(
        onChanged: (categorySelected) {
          if (categorySelected != null) {
            ref
                .read(jokeFiltersProvider.notifier)
                .updateCategory(newCategory: categorySelected);
          }
        },
        value: category,
        items: JokeCategory.values
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
