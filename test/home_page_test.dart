import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jokes_app/home_page.dart';
import 'package:jokes_app/widgets/widgets.dart';
import 'package:jokes_repository/jokes_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockJokesRepository extends Mock implements JokesRepository {}

class JokeMock extends Joke {
  JokeMock({
    required super.type,
    required super.joke,
    required super.setup,
    required super.delivery,
  });
}

void main() {
  late JokesRepository jokesRepository;

  setUp(() {
    jokesRepository = MockJokesRepository();
  });

  group('Home Page', () {
    testWidgets('Renders filters', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: HomePage(jokesRepository: jokesRepository)),
      );

      expect(find.byType(LanguageFilter), findsOneWidget);
      expect(find.byType(TypeFilter), findsOneWidget);
      expect(find.byType(CategoryFilter), findsOneWidget);
    });

    testWidgets('Renders jokes container', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: HomePage(jokesRepository: jokesRepository)),
      );

      expect(find.byType(JokesContainer), findsOneWidget);
    });

    testWidgets('Renders get joke button', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: HomePage(jokesRepository: jokesRepository)),
      );

      expect(find.byType(GetJokeButton), findsOneWidget);
    });

    testWidgets('Render no joke widget', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: HomePage(jokesRepository: jokesRepository)),
      );

      expect(find.byType(NoJokeWidget), findsOneWidget);
      expect(find.text('No jokes to show'), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.tray), findsOneWidget);
    });

    testWidgets('Renders single joke widget', (tester) async {
      final singleJoke = JokeMock(
        type: JokeType.single,
        joke: 'joke',
        setup: '',
        delivery: '',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                JokesContainer(
                  child: JokeWidget(
                    joke: singleJoke,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.text('joke'), findsOneWidget);
    });

    testWidgets('Renders two parts joke widget', (tester) async {
      final singleJoke = JokeMock(
        type: JokeType.twopart,
        joke: '',
        setup: 'setup',
        delivery: 'delivery',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                JokesContainer(
                  child: JokeWidget(
                    joke: singleJoke,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.text('setup'), findsOneWidget);
      expect(find.text('delivery'), findsOneWidget);
    });

    testWidgets('Renders error widget', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                JokesContainer(
                  child: ErrorJokeWidget(text: 'text'),
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.text('text'), findsOneWidget);
      expect(
        find.byIcon(CupertinoIcons.exclamationmark_circle),
        findsOneWidget,
      );
    });
  });
}
