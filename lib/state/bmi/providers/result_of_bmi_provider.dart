import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'bmi_provider.dart';

final resultOfBmiProvider = Provider<String>((ref) {
  final bmiModel = ref.watch(bmiProvider);

  if (bmiModel.bmi >= 25) {
    return 'You have a higher body weight than normal, Try to exercise';
  } else if (bmiModel.bmi > 20) {
    return 'You have a normal body weight, good job';
  } else if (bmiModel.age < 1 || bmiModel.age > 100) {
    return 'your age value is invalid try to enter a value greater than 0 less than 150';
  } else if (bmiModel.weight <= 3 || bmiModel.weight >= 150) {
    return 'your weight is invalid try to enter a value greater than 0 less than 600';
  } else if (bmiModel.height <= 50) {
    return 'your height is invalid try to enter a value greater than 5';
  } else {
    return 'You have a lower body weight than normal, Try eat more';
  }
});
