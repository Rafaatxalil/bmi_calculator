import 'package:bmi_calculator/state/bmi/models/bmi_model.dart';
import 'package:bmi_calculator/state/bmi/notifiers/bmi_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final bmiProvider = StateNotifierProvider<BmiNotifier, BmiModel>(
  (ref) => BmiNotifier(),
);
