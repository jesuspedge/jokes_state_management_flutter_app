import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorJokeWidget extends StatelessWidget {
  const ErrorJokeWidget({
    required this.text,
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyLarge;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(CupertinoIcons.exclamationmark_circle, size: 40),
          const SizedBox(height: 10),
          Text(
            text,
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
