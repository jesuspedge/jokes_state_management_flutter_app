import 'package:flutter/material.dart';
import 'package:jokes_app/home_page.dart';

class JokesApp extends StatelessWidget {
  const JokesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jokes App',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(useMaterial3: true),
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}
