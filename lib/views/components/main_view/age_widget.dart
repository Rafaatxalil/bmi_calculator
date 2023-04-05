import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../state/bmi/providers/bmi_provider.dart';

class AgeWidget extends ConsumerWidget {
  const AgeWidget({super.key});

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
              'AGE',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              ref.watch(bmiProvider).age.toString(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  key: const ValueKey('age_decrement'),
                  onPressed: bmi.setAgeDown,
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.indigo[400]),
                  ),
                  icon: const Icon(
                    Icons.remove,
                  ),
                ),
                IconButton(
                  key: const ValueKey('age'),
                  onPressed: bmi.setAgeUp,
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.indigo[400]),
                  ),
                  icon: const Icon(
                    Icons.add,
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
