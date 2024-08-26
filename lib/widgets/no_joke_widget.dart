import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
