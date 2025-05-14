import 'package:flutter/material.dart';
import 'package:jokes_app/jokes_state/jokes_inherited_widget.dart';

class GetJokeButton extends StatelessWidget {
  const GetJokeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final jokesInheritedState = JokesInheritedWidget.of(context);

    return ElevatedButton(
      onPressed: () async => jokesInheritedState.getJoke(),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        side: BorderSide(color: Colors.white.withAlpha(75)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      child: const Text(
        'Get Joke',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
