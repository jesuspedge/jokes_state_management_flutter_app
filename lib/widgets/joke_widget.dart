import 'package:flutter/material.dart';
import 'package:jokes_repository/jokes_repository.dart';

class JokeWidget extends StatelessWidget {
  const JokeWidget({
    required this.joke,
    super.key,
  });

  final Joke joke;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyLarge;

    return Center(
      child: joke.type == JokeType.single
          ? Text(
              joke.joke,
              style: textStyle,
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  joke.setup,
                  style: textStyle,
                ),
                const SizedBox(height: 10),
                Text(
                  joke.delivery,
                  style: textStyle,
                ),
              ],
            ),
    );
  }
}
