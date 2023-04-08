import 'package:bmi_calculator/enums/gender_type.dart';
import 'package:bmi_calculator/state/bmi/notifiers/bmi_notifier.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late BmiNotifier sut;

  //setup
  setUp(
    () {
      sut = BmiNotifier();
    },
  );

  //test 1
  test(
    'Initial values are correct',
    () {
      expect(sut.state.bmi, 0);
      expect(sut.state.age, 25);
      expect(sut.state.height, 165.0);
      expect(sut.state.weight, 70.0);
      expect(sut.state.gernderType, GenderType.male);
    },
  );

  //test 2
  test(
    'making sure that the state is not changed when the same values are passed',
    () {
      final result = sut.state.copyWith();
      expect(result, sut.state);
    },
  );

  //test 3
  test(
    'making sure that the state is changed when the new values are passed',
    () {
      final result = sut.state.copyWith(bmi: 1.0);
      expect(result, isNot(sut.state));
    },
  );

  //test 4
  test(
    'Making sure that setters work correctly',
    () {
      final setBmi = sut.state.copyWith(bmi: 1.0);
      expect(setBmi.bmi, 1.0);

      final setAge = sut.state.copyWith(age: 1);
      expect(setAge.age, 1);

      final setHeight = sut.state.copyWith(height: 1.0);
      expect(setHeight.height, 1.0);

      final setWeight = sut.state.copyWith(weight: 1.0);
      expect(setWeight.weight, 1.0);

      final setGenderType = sut.state.copyWith(gernderType: GenderType.female);
      expect(setGenderType.gernderType, GenderType.female);
    },
  );

  //test 5
  test(
    'making sure that calculateMetricBmi method works correctly',
    () {
      // with default values
      sut.calculateMetricBmi();
      final result = sut.state.bmi.toStringAsFixed(2);
      expect(result, '24.71');

      // with incorrect range values for height retutns 0.0
      sut.state = sut.state.copyWith(height: 0.0);
      sut.calculateMetricBmi();
      expect(sut.state.bmi, 0.0);

      sut.state = sut.state.copyWith(height: 300.0);
      sut.calculateMetricBmi();
      expect(sut.state.bmi, 0.0);

      // with incorrect range values for age retutns 0.0
      sut.state = sut.state.copyWith(age: 0);
      sut.calculateMetricBmi();
      expect(sut.state.bmi, 0.0);

      sut.state = sut.state.copyWith(age: 200);
      sut.calculateMetricBmi();
      expect(sut.state.bmi, 0.0);

      // with incorrect range values for weight retutns 0.0
      sut.state = sut.state.copyWith(weight: 0.0);
      sut.calculateMetricBmi();
      expect(sut.state.bmi, 0.0);

      sut.state = sut.state.copyWith(weight: 200.0);
      sut.calculateMetricBmi();
      expect(sut.state.bmi, 0.0);

      // with correct values
      sut.state = sut.state.copyWith(
        age: 25,
        height: 165.0,
        weight: 70.0,
      );
      sut.calculateMetricBmi();
      final result2 = sut.state.bmi.toStringAsFixed(2);
      expect(result2, '24.71');
    },
  );

  //test 6
  test(
    'making sure that calculateImperialBmi works correctly',
    () {
      // with incorrect range values for height retutns 0.0
      sut.state = sut.state.copyWith(height: 0.0, weight: 154.3);
      sut.calculateImperialBmi();
      expect(sut.state.bmi, 0.0);

      sut.state = sut.state.copyWith(height: 7.0, weight: 154.3);
      sut.calculateImperialBmi();
      expect(sut.state.bmi, 0.0);

      // with incorrect range values for age retutns 0.0
      sut.state = sut.state.copyWith(age: 0);
      sut.calculateImperialBmi();
      expect(sut.state.bmi, 0.0);

      sut.state = sut.state.copyWith(age: 200);
      sut.calculateImperialBmi();
      expect(sut.state.bmi, 0.0);

      // with incorrect range values for weight retutns 0.0
      sut.state = sut.state.copyWith(weight: 0.0, height: 5.4);
      sut.calculateImperialBmi();
      expect(sut.state.bmi, 0.0);

      sut.state = sut.state.copyWith(weight: 350.0, height: 5.4);
      sut.calculateImperialBmi();
      expect(sut.state.bmi, 0.0);

      // with correct values
      sut.state = sut.state.copyWith(
        age: 25,
        height: 6.5,
        weight: 330.6,
        gernderType: GenderType.male,
      );
      sut.calculateImperialBmi();
      final result2 = sut.state.bmi.toStringAsFixed(2);
      expect(result2, '37.04');
    },
  );
}
