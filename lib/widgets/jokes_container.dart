import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokes_app/blocs/blocs.dart';
import 'package:jokes_app/widgets/widgets.dart';

class JokesContainer extends StatelessWidget {
  const JokesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withAlpha(75)),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: BlocBuilder<JokesBloc, JokesState>(
              builder: (context, state) {
                return switch (state) {
                  // Initial case
                  JokesInitial() => const NoJokeWidget(),

                  // Loading case
                  JokesLoading() => const LoadingWidget(),

                  // Success case
                  JokesSuccess(joke: final joke) => JokeWidget(joke: joke),

                  // Error case
                  JokesError(message: final message) =>
                    ErrorJokeWidget(text: message),
                };
              },
            ),
          ),
        ),
      ),
    );
  }
}
