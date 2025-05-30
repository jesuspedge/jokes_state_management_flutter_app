import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jokes_app/states/states.dart';
import 'package:jokes_app/widgets/widgets.dart';
import 'package:jokes_repository/jokes_repository.dart';

class JokesContainer extends ConsumerWidget {
  const JokesContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch jokes state
    final jokesState = ref.watch(jokesProvider);

    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withAlpha(75)),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: jokesState.when(
              // Data case
              data: (joke) {
                /// Not joke case
                if (joke == null) {
                  return const NoJokeWidget();
                }

                /// Joke case
                else {
                  return JokeWidget(joke: joke);
                }
              },

              // Loading case
              loading: () => const LoadingWidget(),

              // Error case
              error: (error, stackTrace) {
                var message = 'Unexpected error';

                if (error is Failure) {
                  message = error.message;
                }

                return ErrorJokeWidget(text: message);
              },
            ),
          ),
        ),
      ),
    );
  }
}
