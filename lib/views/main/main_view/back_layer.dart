import 'package:bmi_calculator/state/bmi/providers/bmi_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../enums/measurement.dart';
import '../../../state/measurement/providers/mesurement.dart';
import '../../../state/theme/provider/theme_provider.dart';

class BackLayer extends ConsumerWidget {
  const BackLayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SwitchListTile(
            value: ref.watch(themeProvider) == ThemeMode.dark,
            onChanged: (value) {
              ref.read(themeProvider.notifier).themeMode =
                  value ? ThemeMode.dark : ThemeMode.light;
            },
            title: Text(
              'Dark mode',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          ListTile(
            leading: Text(
              'Measurement',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            trailing: SegmentedButton(
              style: const ButtonStyle(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              segments: [
                ButtonSegment(
                  value: Measurement.metric,
                  label: Text(
                    'Metric',
                    style: TextStyle(
                      color: ref.watch(measureProvider) == Measurement.metric
                          ? Colors.white
                          : ref.watch(themeProvider) == ThemeMode.dark
                              ? Colors.white
                              : Colors.black87,
                    ),
                  ),
                ),
                ButtonSegment(
                  value: Measurement.imperial,
                  label: Text(
                    'Imperial',
                    style: TextStyle(
                      color: ref.watch(measureProvider) == Measurement.metric
                          ? ref.watch(themeProvider) == ThemeMode.dark
                              ? Colors.white
                              : Colors.black87
                          : Colors.white,
                    ),
                  ),
                ),
              ],
              selected: {ref.watch(measureProvider)},
              onSelectionChanged: (newValue) {
                if (newValue.first == Measurement.imperial) {
                  ref.read(bmiProvider.notifier).setHeight(5.4);
                  ref.read(bmiProvider.notifier).setWeight(154.3);
                } else {
                  ref.read(bmiProvider.notifier).setHeight(165);
                  ref.read(bmiProvider.notifier).setWeight(70);
                }
                ref.read(measureProvider.notifier).state = newValue.first;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
            child: Chip(
              label: Text(ref.watch(measureProvider) == Measurement.imperial
                  ? 'Imperial: use feet and pounds'
                  : 'Metric: use centimeters and kilograms'),
            ),
          ),
        ],
      ),
    );
  }
}
