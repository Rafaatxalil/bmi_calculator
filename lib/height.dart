import 'package:bmi_calculator/bmi_calculator.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Height extends ConsumerWidget {
  const Height({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          const Text(
            'HEIGHT',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                ref.watch(bmiProvider).getHeight.toString(),
                style: const TextStyle(
                  fontSize: 35,
                ),
              ),
              const SizedBox(
                width: 2,
              ),
              const Text('cm'),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Consumer(
            builder: (context, ref, child) => Slider(
              min: 0,
              max: 200,
              value: double.parse(ref.watch(bmiProvider).getHeight.toString()),
              onChanged: (x) {
                ref.read(bmiProvider).setHeight(x.toInt());
              },
            ),
          ),
        ],
      ),
    );
  }
}
