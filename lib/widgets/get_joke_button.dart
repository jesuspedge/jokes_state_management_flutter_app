import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokes_app/blocs/blocs.dart';

class GetJokeButton extends StatelessWidget {
  const GetJokeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final filtersState = context.read<JokeFiltersCubit>().state;

        context.read<JokesBloc>().add(
              GetJoke(
                language: filtersState.language,
                category: filtersState.category,
                type: filtersState.type,
              ),
            );
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        side: BorderSide(color: Colors.white.withAlpha(75)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      child: const Text(
        'Get Joke',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
