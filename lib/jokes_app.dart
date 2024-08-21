import 'package:flutter/material.dart';
import 'package:jokes_app/home_page.dart';
import 'package:jokes_repository/jokes_repository.dart';

class JokesApp extends StatelessWidget {
  const JokesApp({
    required this.jokesRepository,
    super.key,
  });

  final JokesRepository jokesRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jokes App',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(useMaterial3: true),
      theme: ThemeData.dark(),
      home: HomePage(jokesRepository: jokesRepository),
    );
  }
}
