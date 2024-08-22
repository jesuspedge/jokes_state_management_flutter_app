import 'package:flutter/material.dart';
import 'package:jokes_repository/jokes_repository.dart';

class TypeFilter extends StatelessWidget {
  const TypeFilter({
    required this.value,
    required this.onChanged,
    super.key,
  });

  final JokeType? value;
  final void Function(JokeType?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(15),
      ),
      child: DropdownButtonFormField<JokeType>(
        onChanged: onChanged,
        value: value,
        items: JokeType.values
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
