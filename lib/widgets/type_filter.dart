import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokes_app/blocs/blocs.dart';
import 'package:jokes_repository/jokes_repository.dart';

class TypeFilter extends StatelessWidget {
  const TypeFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white.withAlpha(75)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: BlocSelector<JokeFiltersCubit, JokeFiltersState, JokeType>(
        selector: (state) => state.type,
        builder: (context, type) => DropdownButton<JokeType>(
          onChanged: (typeSelected) {
            if (typeSelected != null) {
              context
                  .read<JokeFiltersCubit>()
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
          underline:
              const DropdownButtonHideUnderline(child: SizedBox.shrink()),
        ),
      ),
    );
  }
}
