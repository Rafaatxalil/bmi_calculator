import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:bmi_calculator/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets(
    'Tap the female gender button and then tap on male gender button in 2 seconds',
    (widgetTester) async {
      //setup
      app.main();
      await widgetTester.pumpAndSettle();
      final buttonFinder = find.byIcon(Icons.female);
      final buttonFinder2 = find.byIcon(Icons.male);
      //do

      await widgetTester.tap(buttonFinder);
      await Future.delayed(const Duration(seconds: 2));
      await widgetTester.tap(buttonFinder2);

      await widgetTester.pumpAndSettle();

      //test
      expect(find.text('60'), findsOneWidget);
    },
  );

  testWidgets(
    'drag the slider 33 units to the left in duriation of 7 seconds',
    (widgetTester) async {
      //setup
      app.main();
      await widgetTester.pumpAndSettle();
      final findSlider = find.byKey(const Key('height_slider'));

      //do

      // await widgetTester.drag(findSlider, const Offset(-10, 0));

      await widgetTester.timedDrag(
          findSlider, const Offset(-194, 0), Duration(seconds: 7));

      await widgetTester.pumpAndSettle();

      //test
      //expect(find.text('60'), findsOneWidget);
    },
  );

  testWidgets(
    'drag the slider 33 units to the right in duriation of 7 seconds',
    (widgetTester) async {
      //setup
      app.main();
      await widgetTester.pumpAndSettle();
      final findSlider = find.byKey(const Key('height_slider'));

      //do

      // await widgetTester.drag(findSlider, const Offset(-10, 0));

      await widgetTester.timedDrag(
          findSlider, const Offset(194, 0), Duration(seconds: 7));

      await widgetTester.pumpAndSettle();

      //test
      //expect(find.text('60'), findsOneWidget);
    },
  );

  testWidgets(
    'Tap the weight increment button 30 times with half second delay',
    (widgetTester) async {
      //setup
      app.main();
      await widgetTester.pumpAndSettle();
      final buttonFinder = find.byKey(const Key('weight_increment'));

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
    'Tap the weight decrement button 30 times with half second delay',
    (widgetTester) async {
      //setup
      app.main();
      await widgetTester.pumpAndSettle();
      final buttonFinder = find.byKey(const Key('weight_decrement'));

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

  testWidgets(
    'find the BMI for an underweighted person',
    (widgetTester) async {
      //setup
      app.main();
      await widgetTester.pumpAndSettle();
      final buttonFinder = find.byKey(const Key('weight_decrement'));
      final calculateBMI = find.byKey(const Key('calculate-btn'));
      //do
      for (var i = 0; i < 15; i++) {
        await widgetTester.tap(buttonFinder);
        await Future.delayed(const Duration(milliseconds: 100));
      }
      await widgetTester.tap(calculateBMI);
      await Future.delayed(const Duration(seconds: 5));
      await widgetTester.pumpAndSettle();
    },
  );
  testWidgets(
    'find the BMI for an Overweighted person',
    (widgetTester) async {
      //setup
      app.main();
      await widgetTester.pumpAndSettle();
      final buttonFinder = find.byKey(const Key('weight_increment'));
      final calculateBMI = find.byKey(const Key('calculate-btn'));
      //do
      for (var i = 0; i < 25; i++) {
        await widgetTester.tap(buttonFinder);
        await Future.delayed(const Duration(milliseconds: 100));
      }
      await widgetTester.tap(calculateBMI);
      await Future.delayed(const Duration(seconds: 5));
      await widgetTester.pumpAndSettle();
    },
  );

  testWidgets(
    'find the BMI for a normal weighted person',
    (widgetTester) async {
      //setup
      app.main();
      await widgetTester.pumpAndSettle();

      final calculateBMI = find.byKey(const Key('calculate-btn'));
      //do

      await widgetTester.tap(calculateBMI);
      await Future.delayed(const Duration(seconds: 5));
      await widgetTester.pumpAndSettle();
    },
  );

  testWidgets(
    'find the BMI for age = 0 ',
    (widgetTester) async {
      //setup

      app.main();
      await widgetTester.pumpAndSettle();

      final calculateBMI = find.byKey(const Key('calculate-btn'));
      final buttonFinder = find.byKey(const Key('age_decrement'));

      //do
      for (var i = 0; i < 30; i++) {
        await widgetTester.tap(buttonFinder);
        await Future.delayed(const Duration(milliseconds: 100));
      }
      //do

      await widgetTester.tap(calculateBMI);
      await Future.delayed(const Duration(seconds: 5));
      await widgetTester.pumpAndSettle();
    },
  );

  testWidgets(
    'find the BMI for weight = 0 ',
    (widgetTester) async {
      //setup

      app.main();
      await widgetTester.pumpAndSettle();

      final calculateBMI = find.byKey(const Key('calculate-btn'));
      final buttonFinder = find.byKey(const Key('weight_decrement'));

      //do
      for (var i = 0; i < 55; i++) {
        await widgetTester.tap(buttonFinder);
        await Future.delayed(const Duration(milliseconds: 100));
      }

      await widgetTester.tap(calculateBMI);
      await Future.delayed(const Duration(seconds: 10));
      await widgetTester.pumpAndSettle();
    },
  );

  testWidgets(
    'finding the bmi when height = 0  entered',
    (widgetTester) async {
      //setup
      app.main();
      await widgetTester.pumpAndSettle();
      final findSlider = find.byKey(const Key('height_slider'));
      final calculateBMI = find.byKey(const Key('calculate-btn'));

      await widgetTester.timedDrag(
          findSlider, const Offset(-590, 0), Duration(seconds: 7));
      await Future.delayed(const Duration(seconds: 2));
      await widgetTester.tap(calculateBMI);
      await Future.delayed(const Duration(seconds: 10));
      await widgetTester.pumpAndSettle();

      //test
      //expect(find.text('60'), findsOneWidget);
    },
  );
}
