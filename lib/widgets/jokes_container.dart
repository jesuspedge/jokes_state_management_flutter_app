import 'package:flutter/material.dart';
import 'package:jokes_app/jokes_state/jokes_inherited_widget.dart';
import 'package:jokes_app/widgets/widgets.dart';

class JokesContainer extends StatelessWidget {
  const JokesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final jokesInheritedState = JokesInheritedWidget.of(context);

    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withAlpha(75)),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: switch (jokesInheritedState.jokesState) {
              // Initial case
              JokesInitialState() => const NoJokeWidget(),

              // Loading case
              JokesLoadingState() => const LoadingWidget(),

              // Success case
              JokesSuccessState(joke: final joke) => JokeWidget(joke: joke),

              // Error case
              JokesErrorState(message: final message) =>
                ErrorJokeWidget(text: message),
            },
          ),
        ),
      ),
    );
  }
}
