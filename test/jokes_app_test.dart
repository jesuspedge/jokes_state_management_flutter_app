import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jokes_app/home_page.dart';
import 'package:jokes_app/jokes_app.dart';
import 'package:jokes_app/jokes_state/jokes_inherited_widget.dart';
import 'package:jokes_repository/jokes_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockJokesRepository extends Mock implements JokesRepository {}

void main() {
  late JokesRepository jokesRepository;

  setUp(() {
    jokesRepository = MockJokesRepository();
  });

  group('Jokes App', () {
    testWidgets('Renders MaterialApp with dark theme', (tester) async {
      await tester.pumpWidget(JokesApp(jokesRepository: jokesRepository));

      expect(find.byType(MaterialApp), findsOneWidget);

      final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(materialApp.theme, equals(ThemeData.dark()));
    });

    testWidgets('Renders JokesStateProvider with HomePage', (tester) async {
      await tester.pumpWidget(JokesApp(jokesRepository: jokesRepository));

      expect(find.byType(JokesInheritedStateProvider), findsOneWidget);
      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}
