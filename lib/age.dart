import 'package:bmi_calculator/bmi_calculator.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Age extends ConsumerWidget {
  const Age({super.key});

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
              'AGE',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            Text(
              ref.watch(bmiProvider).getAge.toString(),
              style: const TextStyle(
                fontSize: 35,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: ref.read(bmiProvider).subAge,
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
                  onPressed: ref.read(bmiProvider).addAge,
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
