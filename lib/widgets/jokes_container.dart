import 'package:flutter/material.dart';

class JokesContainer extends StatelessWidget {
  const JokesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withOpacity(0.3)),
        ),
      ),
    );
  }
}
