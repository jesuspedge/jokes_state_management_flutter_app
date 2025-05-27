import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokes_app/blocs/blocs.dart';
import 'package:jokes_repository/jokes_repository.dart';

class CategoryFilter extends StatelessWidget {
  const CategoryFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white.withAlpha(75)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: BlocSelector<JokeFiltersCubit, JokeFiltersState, JokeCategory>(
        selector: (state) => state.category,
        builder: (context, category) => DropdownButton<JokeCategory>(
          onChanged: (categorySelected) {
            if (categorySelected != null) {
              context
                  .read<JokeFiltersCubit>()
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
          underline:
              const DropdownButtonHideUnderline(child: SizedBox.shrink()),
        ),
      ),
    );
  }
}
