import 'package:bmi_calculator/enums/measurement.dart';
import 'package:bmi_calculator/state/measurement/providers/mesurement.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../state/bmi/providers/bmi_provider.dart';

class WeightWidget extends ConsumerWidget {
  const WeightWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bmi = ref.read(bmiProvider.notifier);
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(
          20,
        ),
        decoration: BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Text(
              'WEIGHT',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 5,
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Text(
                  ref.watch(bmiProvider).weight.toString(),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Positioned(
                  bottom: 10,
                  right: -23,
                  child: Text(
                    ref.watch(measureProvider) == Measurement.metric
                        ? 'kg'
                        : 'lb',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  key: const ValueKey('weight_decrement'),
                  onPressed: bmi.setWeightDown,
                  icon: const Icon(
                    Icons.remove,
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.indigo[400]),
                  ),
                ),
                IconButton(
                  key: const ValueKey('weight_increment'),
                  onPressed: bmi.setWeightUp,
                  icon: const Icon(
                    Icons.add,
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.indigo[400]),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}