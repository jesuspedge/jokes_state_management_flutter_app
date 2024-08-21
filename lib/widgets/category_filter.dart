import 'package:flutter/material.dart';
import 'package:jokes_repository/jokes_repository.dart';

class CategoryFilter extends StatelessWidget {
  const CategoryFilter({
    required this.value,
    required this.onChanged,
    super.key,
  });

  final JokeCategory? value;
  final void Function(JokeCategory?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<JokeCategory>(
      onChanged: onChanged,
      value: value,
      items: JokeCategory.values
          .map(
            (value) => DropdownMenuItem(value: value, child: Text(value.text)),
          )
          .toList(),
    );
  }
}
