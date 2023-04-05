import 'package:bmi_calculator/enums/measurement.dart';
import 'package:bmi_calculator/state/bmi/providers/result_of_bmi_provider.dart';
import 'package:bmi_calculator/state/measurement/providers/mesurement.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../state/bmi/providers/bmi_provider.dart';

class CalculateButtonWidget extends ConsumerWidget {
  const CalculateButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(
        top: 30,
      ),
      child: FilledButton.tonal(
        style: ButtonStyle(
          padding: const MaterialStatePropertyAll(
            EdgeInsets.symmetric(
              horizontal: 80,
              vertical: 10,
            ),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        child: Text(
          'Calculate',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        onPressed: () async {
          final bmi = ref.read(bmiProvider.notifier);
          ref.watch(measureProvider) == Measurement.metric
              ? bmi.calculateMetricBmi()
              : bmi.calculateImperialBmi();
          await showDialog(
            context: context,
            builder: (_) => Padding(
              padding: const EdgeInsets.all(10),
              child: AlertDialog(
                title: Text(
                    'Your BMI is: ${ref.watch(bmiProvider).bmi.toStringAsFixed(2)}'),
                content: Text(
                  ref.watch(resultOfBmiProvider),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
