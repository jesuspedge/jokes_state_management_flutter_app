import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jokes_app/home_page.dart';
import 'package:jokes_app/jokes_app.dart';

void main() {
  group('Jokes App', () {
    testWidgets('Renders ProviderScope', (tester) async {
      await tester.pumpWidget(const ProviderScope(child: JokesApp()));

      expect(find.byType(ProviderScope), findsOneWidget);
    });

    testWidgets('Renders MaterialApp with dark theme', (tester) async {
      await tester.pumpWidget(const ProviderScope(child: JokesApp()));

      expect(find.byType(MaterialApp), findsOneWidget);

      final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(materialApp.theme, equals(ThemeData.dark()));
    });

    testWidgets('Renders Home Page', (tester) async {
      await tester.pumpWidget(const ProviderScope(child: JokesApp()));

      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}
