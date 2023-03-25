import 'package:bmi_calculator/bmi_calculator.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Weight extends ConsumerWidget {
  const Weight({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            const Text(
              'WEIGHT',
              style: TextStyle(fontSize: 15),
            ),
            Text(
              ref.watch(bmiProvider).getWeight.toString(),
              style: const TextStyle(
                fontSize: 35,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: ref.read(bmiProvider).subWeight,
                  icon: const Icon(
                    Icons.remove,
                  ),
                  style: ButtonStyle(
                    shape: const MaterialStatePropertyAll(CircleBorder()),
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.indigo[400]),
                  ),
                ),
                IconButton(
                  onPressed: ref.read(bmiProvider).addWeight,
                  icon: const Icon(
                    Icons.add,
                  ),
                  style: ButtonStyle(
                    shape: const MaterialStatePropertyAll(CircleBorder()),
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
