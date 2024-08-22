import 'package:flutter/material.dart';
import 'package:jokes_repository/jokes_repository.dart';

class LanguageFilter extends StatelessWidget {
  const LanguageFilter({
    required this.value,
    required this.onChanged,
    super.key,
  });

  final JokeLanguage? value;
  final void Function(JokeLanguage?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(15),
      ),
      child: DropdownButtonFormField<JokeLanguage>(
        onChanged: onChanged,
        value: value,
        items: JokeLanguage.values
            .map(
              (value) =>
                  DropdownMenuItem(value: value, child: Text(value.text)),
            )
            .toList(),
        dropdownColor: Colors.black.withOpacity(0.7),
        elevation: 3,
        decoration: const InputDecoration(border: InputBorder.none),
      ),
    );
  }
}
