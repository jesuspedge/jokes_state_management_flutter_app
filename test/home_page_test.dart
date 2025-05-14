import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jokes_app/home_page.dart';
import 'package:jokes_app/jokes_state/jokes_inherited_widget.dart';
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
  late JokesRepository mockJokesRepository;

  setUp(() {
    mockJokesRepository = MockJokesRepository();
  });

  group('Home Page', () {
    testWidgets('Renders filters', (tester) async {
      // act
      await tester.pumpWidget(
        MaterialApp(
          home: JokesInheritedStateProvider(
            jokesRepository: mockJokesRepository,
            child: const HomePage(),
          ),
        ),
      );

      // assert
      expect(find.byType(LanguageFilter), findsOneWidget);
      expect(find.byType(TypeFilter), findsOneWidget);
      expect(find.byType(CategoryFilter), findsOneWidget);
    });

    testWidgets('Renders jokes container', (tester) async {
      // act
      await tester.pumpWidget(
        MaterialApp(
          home: JokesInheritedStateProvider(
            jokesRepository: mockJokesRepository,
            child: const HomePage(),
          ),
        ),
      );

      // assert
      expect(find.byType(JokesContainer), findsOneWidget);
    });

    testWidgets('Renders get joke button', (tester) async {
      // act
      await tester.pumpWidget(
        MaterialApp(
          home: JokesInheritedStateProvider(
            jokesRepository: mockJokesRepository,
            child: const HomePage(),
          ),
        ),
      );

      // assert
      expect(find.byType(GetJokeButton), findsOneWidget);
    });

    testWidgets('Render no joke widget', (tester) async {
      // act
      await tester.pumpWidget(
        MaterialApp(
          home: JokesInheritedStateProvider(
            jokesRepository: mockJokesRepository,
            child: const HomePage(),
          ),
        ),
      );

      // assert
      expect(find.byType(NoJokeWidget), findsOneWidget);
      expect(find.text('No jokes to show'), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.tray), findsOneWidget);
    });

    testWidgets('Renders single joke widget', (tester) async {
      // arrange
      final singleJoke = JokeMock(
        type: JokeType.single,
        joke: 'joke',
        setup: '',
        delivery: '',
      );

      when(
        () => mockJokesRepository.getJoke(
          category: JokeCategory.any,
          language: JokeLanguage.en,
          type: JokeType.single,
        ),
      ).thenAnswer((_) async => Successful(value: singleJoke));

      /// act
      await tester.pumpWidget(
        MaterialApp(
          home: JokesInheritedStateProvider(
            jokesRepository: mockJokesRepository,
            child: const HomePage(),
          ),
        ),
      );

      final jokesButton = find.byType(GetJokeButton);
      await tester.tap(jokesButton);
      await tester.pumpAndSettle();

      // assert
      expect(find.byType(JokeWidget), findsOneWidget);
      expect(find.text('joke'), findsOneWidget);
    });

    testWidgets('Renders two parts joke widget', (tester) async {
      // arrange
      final twoPartsJoke = JokeMock(
        type: JokeType.twopart,
        joke: '',
        setup: 'setup',
        delivery: 'delivery',
      );

      when(
        () => mockJokesRepository.getJoke(
          category: JokeCategory.any,
          language: JokeLanguage.en,
          type: JokeType.single,
        ),
      ).thenAnswer((_) async => Successful(value: twoPartsJoke));

      // act
      await tester.pumpWidget(
        MaterialApp(
          home: JokesInheritedStateProvider(
            jokesRepository: mockJokesRepository,
            child: const HomePage(),
          ),
        ),
      );

      final jokesButton = find.byType(GetJokeButton);
      await tester.tap(jokesButton);
      await tester.pumpAndSettle();

      // assert
      expect(find.byType(JokeWidget), findsOneWidget);
      expect(find.text('setup'), findsOneWidget);
      expect(find.text('delivery'), findsOneWidget);
    });

    testWidgets('Renders error widget', (tester) async {
      // arrange
      const errorMessage = 'error message';

      when(
        () => mockJokesRepository.getJoke(
          category: JokeCategory.any,
          language: JokeLanguage.en,
          type: JokeType.single,
        ),
      ).thenAnswer(
        (_) async => Unsuccessful(value: Failure(message: errorMessage)),
      );

      // act
      await tester.pumpWidget(
        MaterialApp(
          home: JokesInheritedStateProvider(
            jokesRepository: mockJokesRepository,
            child: const HomePage(),
          ),
        ),
      );

      final jokesButton = find.byType(GetJokeButton);
      await tester.tap(jokesButton);
      await tester.pumpAndSettle();

      // assert
      expect(find.byType(ErrorJokeWidget), findsOneWidget);
      expect(find.text(errorMessage), findsOneWidget);
      expect(
        find.byIcon(CupertinoIcons.exclamationmark_circle),
        findsOneWidget,
      );
    });
  });
}
