import 'package:bmi_calculator/enums/gender_type.dart';
import 'package:bmi_calculator/state/bmi/models/bmi_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late BmiModel sut;

  //setup
  setUp(
    () {
      sut = const BmiModel(
        bmi: 0.0,
        age: 0,
        height: 0.0,
        weight: 0.0,
        gernderType: GenderType.male,
      );
    },
  );

  //test 1
  test(
    'Initial values are correct',
    () {
      expect(sut.bmi, 0);
      expect(sut.age, 0);
      expect(sut.height, 0.0);
      expect(sut.weight, 0.0);
      expect(sut.gernderType, GenderType.male);
    },
  );

  //test 2
  test(
    'CopyWith does not return a new instance, means that equality operator is working',
    () {
      final result = sut.copyWith();
      expect(result, sut);
    },
  );

  //test 3
  test(
    'copyWith method works correctly with new values',
    () {
      final setBmi = sut.copyWith(bmi: 1.0);
      expect(setBmi.bmi, 1.0);

      final setAge = sut.copyWith(age: 1);
      expect(setAge.age, 1);

      final setHeight = sut.copyWith(height: 1.0);
      expect(setHeight.height, 1.0);

      final setWeight = sut.copyWith(weight: 1.0);
      expect(setWeight.weight, 1.0);

      final setGenderType = sut.copyWith(gernderType: GenderType.female);
      expect(setGenderType.gernderType, GenderType.female);
    },
  );
}
