import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jokes_app/states/states.dart';
import 'package:jokes_repository/jokes_repository.dart';

class TypeFilter extends ConsumerWidget {
  const TypeFilter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch type filter state
    final type = ref.watch(jokeFiltersProvider).type;

    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white.withAlpha(75)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton<JokeType>(
        onChanged: (typeSelected) {
          if(typeSelected != null) {
            ref
                .read(jokeFiltersProvider.notifier)
                .updateType(newType: typeSelected);
          }
        },
        value: type,
        items: JokeType.values
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
