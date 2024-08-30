import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jokes_app/home_page.dart';
import 'package:jokes_app/widgets/widgets.dart';
import 'package:jokes_repository/jokes_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockJokesRepository extends Mock implements JokesRepository {}

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
  });
}
