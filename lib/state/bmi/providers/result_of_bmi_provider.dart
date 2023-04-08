import 'package:bmi_calculator/enums/measurement.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../measurement/providers/mesurement.dart';
import 'bmi_provider.dart';

final resultOfBmiProvider = Provider<String>(
  (ref) {
    final bmiModel = ref.watch(bmiProvider);
    final measurementProvider = ref.watch(measureProvider);

    switch (Measurement.values[measurementProvider.index]) {
      case Measurement.metric:
        if (bmiModel.age < 1 || bmiModel.age > 100) {
          return 'Please try an age between 1 and 100';
        } else if (bmiModel.weight < 3 || bmiModel.weight > 150) {
          return 'Please try a weight between 3 and 150';
        } else if (bmiModel.height < 50 || bmiModel.height > 200) {
          return 'Please try a height between 50 and 200';
        }
        break;
      case Measurement.imperial:
        if (bmiModel.age < 1 || bmiModel.age > 100) {
          return 'Please try an age between 1 and 100';
        } else if (bmiModel.weight < 6.6 || bmiModel.weight > 330.6) {
          return 'Please try a weight between 6.6 and 330.6';
        } else if (bmiModel.height < 1.6 || bmiModel.height > 6.5) {
          return 'Please try a height between 1.6 and 6.5';
        }
        break;
    }

    if (bmiModel.bmi >= 25) {
      return 'You have a higher body weight than normal, Try to exercise';
    } else if (bmiModel.bmi > 20) {
      return 'You have a normal body weight, good job';
    } else {
      return 'You have a lower body weight than normal, Try eat more';
    }
  },
);
