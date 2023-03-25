import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:bmi_calculator/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    'Tap the age increment button 30 times with half second delay',
    (widgetTester) async {
      //setup
      app.main();
      await widgetTester.pumpAndSettle();
      final buttonFinder = find.byKey(const Key('age'));

      //do
      for (var i = 0; i < 30; i++) {
        await widgetTester.tap(buttonFinder);
        await Future.delayed(const Duration(milliseconds: 500));
      }
      await widgetTester.pumpAndSettle();

      //test
      expect(find.text('60'), findsOneWidget);
    },
  );

  testWidgets(
    'Tap the age decrement button 30 times with half second delay',
    (widgetTester) async {
      //setup
      app.main();
      await widgetTester.pumpAndSettle();
      final buttonFinder = find.byKey(const Key('age_decrement'));

      //do
      for (var i = 0; i < 30; i++) {
        await widgetTester.tap(buttonFinder);
        await Future.delayed(const Duration(milliseconds: 500));
      }
      await widgetTester.pumpAndSettle();

      //test
      expect(find.text('0'), findsOneWidget);
    },
  );
}
