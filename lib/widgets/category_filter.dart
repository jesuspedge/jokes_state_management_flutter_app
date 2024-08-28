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
    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton<JokeCategory>(
        onChanged: onChanged,
        value: value,
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
