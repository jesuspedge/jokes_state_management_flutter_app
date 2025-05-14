import 'package:flutter/material.dart';
import 'package:jokes_app/jokes_state/jokes_inherited_widget.dart';
import 'package:jokes_repository/jokes_repository.dart';

class CategoryFilter extends StatelessWidget {
  const CategoryFilter({super.key});

  @override
  Widget build(BuildContext context) {
    final jokesInheritedState = JokesInheritedWidget.of(context);

    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white.withAlpha(75)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton<JokeCategory>(
        onChanged: (newCategory) =>
            jokesInheritedState.setCategory(newCategory ?? JokeCategory.any),
        value: jokesInheritedState.category,
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
