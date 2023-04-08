import 'package:bmi_calculator/enums/gender_type.dart';
import 'package:bmi_calculator/enums/measurement.dart';
import 'package:bmi_calculator/state/bmi/providers/bmi_provider.dart';
import 'package:bmi_calculator/state/measurement/providers/mesurement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:bmi_calculator/main.dart' as app;

void main() {
  testWidgets(
    'calculating bmi for a normal person'
    'gender: male, age: 30, weight: 176.4, height: 6'
    'should return a bmi of 22.62',
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

      // change to imperial
      final measurementButton = find.byKey(const Key('measurement_button'));
      await widgetTester.tap(measurementButton);
      providerConainer.read(measureProvider.notifier).state =
          Measurement.imperial;
      providerConainer
          .read(bmiProvider.notifier)
          .changeMeasurement(Measurement.imperial);

      // await widgetTester.pumpAndSettle();
      //do
      await widgetTester.enterText(ageInput, '30');
      bmi.setAge(30);
      await widgetTester.enterText(weightInput, '176.4');
      bmi.setWeight(176.4);
      await widgetTester.drag(heightSlider, const Offset(115, 0));
      bmi.setHeight(6);
      await widgetTester.tap(femaleButton);
      bmi.setGender(GenderType.female);
      await widgetTester.tap(maleButton);
      bmi.setGender(GenderType.male);
      await widgetTester.tap(calculateButton);
      bmi.calculateImperialBmi();
      await widgetTester.pumpAndSettle();

      //verify
      expect(bmi.state.bmi.toStringAsFixed(2), '22.62');
    },
  );

  testWidgets(
    'calculating bmi for an overweighted person'
    'gender: femail, age:25, weight: 198.4, height: 5.2'
    'should return a bmi of 36.17',
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

      // change to imperial
      final measurementButton = find.byKey(const Key('measurement_button'));
      await widgetTester.tap(measurementButton);
      providerConainer.read(measureProvider.notifier).state =
          Measurement.imperial;
      providerConainer
          .read(bmiProvider.notifier)
          .changeMeasurement(Measurement.imperial);

      //do
      await widgetTester.enterText(ageInput, '25');
      bmi.setAge(25);
      await widgetTester.enterText(weightInput, '198.4');
      bmi.setWeight(198.4);
      await widgetTester.drag(heightSlider, const Offset(70, 0));
      bmi.setHeight(5.2);
      await widgetTester.tap(femaleButton);
      bmi.setGender(GenderType.female);
      await widgetTester.tap(calculateButton);
      bmi.calculateImperialBmi();
      await widgetTester.pumpAndSettle();

      //verify
      expect(bmi.state.bmi.toStringAsFixed(2), '36.17');
    },
  );

  testWidgets(
    'calculating bmi for an underweighted person'
    'gender: femail, age:20, weight: 116.8, height: 5.6'
    'should return a bmi of 18.81',
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

      // change to imperial
      final measurementButton = find.byKey(const Key('measurement_button'));
      await widgetTester.tap(measurementButton);
      providerConainer.read(measureProvider.notifier).state =
          Measurement.imperial;
      providerConainer
          .read(bmiProvider.notifier)
          .changeMeasurement(Measurement.imperial);

      //do
      await widgetTester.enterText(ageInput, '20');
      bmi.setAge(20);
      await widgetTester.enterText(weightInput, '116.8');
      bmi.setWeight(116.8);
      await widgetTester.drag(heightSlider, const Offset(90, 0));
      bmi.setHeight(5.6);
      await widgetTester.tap(femaleButton);
      bmi.setGender(GenderType.female);
      await widgetTester.tap(calculateButton);
      bmi.calculateImperialBmi();
      await widgetTester.pumpAndSettle();

      //verify
      expect(bmi.state.bmi.toStringAsFixed(2), '18.81');
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

      // change to imperial
      final measurementButton = find.byKey(const Key('measurement_button'));
      await widgetTester.tap(measurementButton);
      providerConainer.read(measureProvider.notifier).state =
          Measurement.imperial;
      providerConainer
          .read(bmiProvider.notifier)
          .changeMeasurement(Measurement.imperial);

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

      // change to imperial
      final measurementButton = find.byKey(const Key('measurement_button'));
      await widgetTester.tap(measurementButton);
      providerConainer.read(measureProvider.notifier).state =
          Measurement.imperial;
      providerConainer
          .read(bmiProvider.notifier)
          .changeMeasurement(Measurement.imperial);

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
    'calculating bmi if a weight entered below 6.6'
    'weight entered: 6'
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

      // change to imperial
      final measurementButton = find.byKey(const Key('measurement_button'));
      await widgetTester.tap(measurementButton);
      providerConainer.read(measureProvider.notifier).state =
          Measurement.imperial;
      providerConainer
          .read(bmiProvider.notifier)
          .changeMeasurement(Measurement.imperial);

      //do
      await widgetTester.enterText(weightInput, '6');
      bmi.setWeight(6);
      await widgetTester.tap(calculateButton);
      bmi.calculateMetricBmi();
      await widgetTester.pumpAndSettle();

      //verify
      expect(bmi.state.bmi.toStringAsFixed(2), '0.00');
    },
  );
  testWidgets(
    'calculating bmi if a weight entered over 330.6'
    'weight entered: 335'
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
      // change to imperial
      final measurementButton = find.byKey(const Key('measurement_button'));
      await widgetTester.tap(measurementButton);
      providerConainer.read(measureProvider.notifier).state =
          Measurement.imperial;
      providerConainer
          .read(bmiProvider.notifier)
          .changeMeasurement(Measurement.imperial);

      //do
      await widgetTester.enterText(weightInput, '335');
      bmi.setWeight(335);
      await widgetTester.tap(calculateButton);
      bmi.calculateMetricBmi();
      await widgetTester.pumpAndSettle();

      //verify
      expect(bmi.state.bmi.toStringAsFixed(2), '0.00');
    },
  );
}
