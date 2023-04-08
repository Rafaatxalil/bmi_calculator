import 'package:bmi_calculator/enums/measurement.dart';
import 'package:bmi_calculator/state/measurement/providers/mesurement.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../state/bmi/providers/bmi_provider.dart';

class HeightWidget extends ConsumerWidget {
  const HeightWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bmi = ref.watch(bmiProvider);
    final measure = ref.watch(measureProvider);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            'HEIGHT',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 5,
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Text(
                bmi.height.toStringAsFixed(1),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Positioned(
                bottom: 8,
                right: -26,
                child: Text(
                  measure == Measurement.metric ? 'cm' : 'ft',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Consumer(
            builder: (context, ref, child) => Slider(
              key: const ValueKey('height_slider'),
              min: measure == Measurement.metric ? 50 : 1.6,
              max: measure == Measurement.metric ? 200 : 6.5,
              value: bmi.height,
              onChanged: (newHeight) {
                ref.read(bmiProvider.notifier).setHeight(newHeight);
              },
            ),
          ),
        ],
      ),
    );
  }
}
