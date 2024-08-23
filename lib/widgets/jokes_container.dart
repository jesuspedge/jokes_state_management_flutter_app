import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jokes_repository/jokes_repository.dart';

class JokesContainer extends StatelessWidget {
  const JokesContainer({
    required this.error,
    required this.loading,
    required this.errorMessage,
    this.joke,
    super.key,
  });

  final bool error;
  final bool loading;
  final Joke? joke;
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withOpacity(0.3)),
        ),
        child: loading
            ? const LoadingWidget()
            : joke == null
                ? const NoJokeWidget()
                : const Text('Other widget'),
      ),
    );
  }
}

class NoJokeWidget extends StatelessWidget {
  const NoJokeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyLarge;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(CupertinoIcons.tray, size: 40),
          const SizedBox(height: 10),
          Text(
            'No jokes to show',
            style: textStyle,
          ),
        ],
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: Colors.white),
    );
  }
}
