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
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white.withAlpha(75)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton<JokeType>(
        onChanged: onChanged,
        value: value,
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
