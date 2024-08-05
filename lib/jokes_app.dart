import 'package:flutter/material.dart';

class JokesApp extends StatelessWidget {
  const JokesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jokes App',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Jokes App'),
        ),
      ),
    );
  }
}
