import 'package:bmi_calculator/enums/gender_type.dart';
import 'package:bmi_calculator/state/bmi/providers/bmi_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:bmi_calculator/main.dart' as app;

void main() {
  testWidgets(
    'calculating bmi for a normal person'
    'gender: male, age: 30, weight: 80, height: 183.9'
    'should return a bmi of 22.46',
    (widgetTester) async {
      //setup
      app.main();
      await widgetTester.pumpAndSettle();

      final ageInput = find.byKey(const Key('age_input'));
      final weightInput = find.byKey(const Key('weight_input'));
      final heightSlider = find.byKey(const Key('height_slider'));
      final calculateButton = find.byKey(const Key('calculate_button'));
      final maleButton = find.byKey(const Key('male'));
      final femaleButton = find.byKey(const Key('female'));

      final context = widgetTester.element(find.byType(MaterialApp));
      final providerConainer = ProviderScope.containerOf(context);
      final bmi = providerConainer.read(bmiProvider.notifier);

      //do
      await widgetTester.enterText(ageInput, '30');
      bmi.setAge(30);
      await widgetTester.enterText(weightInput, '80');
      bmi.setWeight(80);
      await widgetTester.drag(heightSlider, const Offset(115, 0));
      bmi.setHeight(183.9);
      await widgetTester.tap(femaleButton);
      bmi.setGender(GenderType.female);
      await widgetTester.tap(maleButton);
      bmi.setGender(GenderType.male);
      await widgetTester.tap(calculateButton);
      bmi.calculateMetricBmi();
      await widgetTester.pumpAndSettle();

      //verify
      expect(bmi.state.bmi.toStringAsFixed(2), '22.46');
    },
  );

  testWidgets(
    'calculating bmi for an overweighted person'
    'gender: femail, age:25, weight: 90, height: 160.9'
    'should return a bmi of 35.26',
    (widgetTester) async {
      //setup
      app.main();
      await widgetTester.pumpAndSettle();

      final context = widgetTester.element(find.byType(MaterialApp));
      final providerConainer = ProviderScope.containerOf(context);
      final bmi = providerConainer.read(bmiProvider.notifier);

      final ageInput = find.byKey(const Key('age_input'));
      final weightInput = find.byKey(const Key('weight_input'));
      final heightSlider = find.byKey(const Key('height_slider'));
      final calculateButton = find.byKey(const Key('calculate_button'));
      final maleButton = find.byKey(const Key('male'));
      final femaleButton = find.byKey(const Key('female'));

      //do
      await widgetTester.enterText(ageInput, '25');
      bmi.setAge(25);
      await widgetTester.enterText(weightInput, '90');
      bmi.setWeight(90);
      await widgetTester.drag(heightSlider, const Offset(70, 0));
      bmi.setHeight(160.9);
      await widgetTester.tap(femaleButton);
      bmi.setGender(GenderType.female);
      await widgetTester.tap(calculateButton);
      bmi.calculateMetricBmi();
      await widgetTester.pumpAndSettle();

      //verify
      expect(bmi.state.bmi.toStringAsFixed(2), '35.26');
    },
  );

  testWidgets(
    'calculating bmi for an underweighted person'
    'gender: femail, age:20, weight: 53, height: 171.1'
    'should return a bmi of 18.80',
    (widgetTester) async {
      //setup
      app.main();
      await widgetTester.pumpAndSettle();

      final context = widgetTester.element(find.byType(MaterialApp));
      final providerConainer = ProviderScope.containerOf(context);
      final bmi = providerConainer.read(bmiProvider.notifier);

      final ageInput = find.byKey(const Key('age_input'));
      final weightInput = find.byKey(const Key('weight_input'));
      final heightSlider = find.byKey(const Key('height_slider'));
      final calculateButton = find.byKey(const Key('calculate_button'));
      final femaleButton = find.byKey(const Key('female'));

      //do
      await widgetTester.enterText(ageInput, '20');
      bmi.setAge(20);
      await widgetTester.enterText(weightInput, '53');
      bmi.setWeight(53);
      await widgetTester.drag(heightSlider, const Offset(90, 0));
      bmi.setHeight(171.1);
      await widgetTester.tap(femaleButton);
      bmi.setGender(GenderType.female);
      await widgetTester.tap(calculateButton);
      bmi.calculateMetricBmi();
      await widgetTester.pumpAndSettle();

      //verify
      expect(bmi.state.bmi.toStringAsFixed(2), '18.80');
    },
  );
  testWidgets(
    'calculating bmi if an age entered below 1'
    'age entered: 0'
    'should return a bmi of 0.00',
    (widgetTester) async {
      //setup
      app.main();
      await widgetTester.pumpAndSettle();

      final context = widgetTester.element(find.byType(MaterialApp));
      final providerConainer = ProviderScope.containerOf(context);
      final bmi = providerConainer.read(bmiProvider.notifier);

      final ageInput = find.byKey(const Key('age_input'));
      final calculateButton = find.byKey(const Key('calculate_button'));

      //do
      await widgetTester.enterText(ageInput, '0');
      bmi.setAge(0);
      await widgetTester.tap(calculateButton);
      bmi.calculateMetricBmi();
      await widgetTester.pumpAndSettle();

      //verify
      expect(bmi.state.bmi.toStringAsFixed(2), '0.00');
    },
  );
  testWidgets(
    'calculating bmi if an age entered over 100'
    'age entered: 101'
    'should return a bmi of 0.00',
    (widgetTester) async {
      //setup
      app.main();
      await widgetTester.pumpAndSettle();

      final context = widgetTester.element(find.byType(MaterialApp));
      final providerConainer = ProviderScope.containerOf(context);
      final bmi = providerConainer.read(bmiProvider.notifier);

      final ageInput = find.byKey(const Key('age_input'));
      final calculateButton = find.byKey(const Key('calculate_button'));

      //do
      await widgetTester.enterText(ageInput, '101');
      bmi.setAge(101);
      await widgetTester.tap(calculateButton);
      bmi.calculateMetricBmi();
      await widgetTester.pumpAndSettle();

      //verify
      expect(bmi.state.bmi.toStringAsFixed(2), '0.00');
    },
  );
  testWidgets(
    'calculating bmi if a weight entered below 3'
    'weight entered: 2'
    'should return a bmi of 0.00',
    (widgetTester) async {
      //setup
      app.main();
      await widgetTester.pumpAndSettle();

      final context = widgetTester.element(find.byType(MaterialApp));
      final providerConainer = ProviderScope.containerOf(context);
      final bmi = providerConainer.read(bmiProvider.notifier);

      final weightInput = find.byKey(const Key('weight_input'));
      final calculateButton = find.byKey(const Key('calculate_button'));

      //do
      await widgetTester.enterText(weightInput, '2');
      bmi.setWeight(2);
      await widgetTester.tap(calculateButton);
      bmi.calculateMetricBmi();
      await widgetTester.pumpAndSettle();

      //verify
      expect(bmi.state.bmi.toStringAsFixed(2), '0.00');
    },
  );
  testWidgets(
    'calculating bmi if a weight entered over 150'
    'weight entered: 151'
    'should return a bmi of 0.00',
    (widgetTester) async {
      //setup
      app.main();
      await widgetTester.pumpAndSettle();

      final context = widgetTester.element(find.byType(MaterialApp));
      final providerConainer = ProviderScope.containerOf(context);
      final bmi = providerConainer.read(bmiProvider.notifier);

      final weightInput = find.byKey(const Key('weight_input'));
      final calculateButton = find.byKey(const Key('calculate_button'));

      //do
      await widgetTester.enterText(weightInput, '151');
      bmi.setWeight(151);
      await widgetTester.tap(calculateButton);
      bmi.calculateMetricBmi();
      await widgetTester.pumpAndSettle();

      //verify
      expect(bmi.state.bmi.toStringAsFixed(2), '0.00');
    },
  );
}
