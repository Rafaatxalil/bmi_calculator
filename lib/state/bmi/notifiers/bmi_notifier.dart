import 'dart:math';

import 'package:bmi_calculator/enums/gender_type.dart';
import 'package:bmi_calculator/enums/measurement.dart';
import 'package:bmi_calculator/state/bmi/models/bmi_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BmiNotifier extends StateNotifier<BmiModel> {
  BmiNotifier()
      : super(
          const BmiModel(
            bmi: 0,
            age: 25,
            height: 165,
            weight: 70,
            gernderType: GenderType.male,
          ),
        );

  void setGender(GenderType genderType) {
    state = state.copyWith(gernderType: genderType);
  }

  void setHeight(double height) {
    state = state.copyWith(height: height);
  }

  void setAge(int age) {
    state = state.copyWith(age: age);
  }

  void setAgeUp() {
    state = state.copyWith(age: state.age + 1);
  }

  void setAgeDown() {
    state = state.copyWith(age: state.age - 1);
  }

  void setWeight(double weight) {
    state = state.copyWith(weight: weight);
  }

  void setWeightUp() {
    state = state.copyWith(weight: state.weight + 1);
  }

  void setWeightDown() {
    state = state.copyWith(weight: state.weight - 1);
  }

  void changeMeasurement(Measurement measurement) {
    switch (Measurement.values[measurement.index]) {
      case Measurement.metric:
        double newHeight = state.height * 30.48;
        if (newHeight > 200) {
          newHeight = 200;
        } else if (newHeight < 50) {
          newHeight = 50;
        } else {
          newHeight = newHeight;
        }
        state = state.copyWith(
          height: newHeight,
          weight: state.weight * 0.453592,
        );
        break;
      case Measurement.imperial:
        double newHeight = state.height * 0.0328084;
        if (newHeight > 6.5) {
          newHeight = 6.5;
        } else if (newHeight < 1.6) {
          newHeight = 1.6;
        } else {
          newHeight = newHeight;
        }
        state = state.copyWith(
          height: newHeight,
          weight: state.weight * 2.20462,
        );
        break;
    }
  }

  void calculateMetricBmi() {
    if (state.age > 0 &&
            state.age < 100 &&
            state.weight > 3 && // 3 kg
            state.weight <= 150 &&
            state.height > 50 && // 50 cm
            state.height <= 200 // 200 cm
        ) {
      double bmiCalculation = (state.weight / pow(state.height / 100, 2)) +
          (state.gernderType.index * 1.5) -
          (state.age * 0.04);
      state = state.copyWith(bmi: bmiCalculation);
    } else {
      state = state.copyWith(bmi: 0);
    }
  }

  void calculateImperialBmi() {
    if (state.age > 0 &&
            state.age < 100 &&
            state.weight > 6.6 && // 3 kg
            state.weight <= 330.6 &&
            state.height > 1.6 && // 50 cm
            state.height <= 6.5 // 200 cm
        ) {
      double bmiCalculation =
          ((state.weight / pow(state.height * 12, 2) * 700)) +
              (state.gernderType.index * 1.5) -
              (state.age * 0.04);
      state = state.copyWith(bmi: bmiCalculation);
    } else {
      state = state.copyWith(bmi: 0);
    }
  }
}
