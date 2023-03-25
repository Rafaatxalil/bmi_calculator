import 'package:bmi_calculator/bmi_calculator.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Gender extends ConsumerWidget {
  final String _gender;
  final IconData _icon;
  final int index;
  const Gender(this._gender, this._icon, this.index, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final genderProvider = ref.read(bmiProvider);
    return Expanded(
      child: GestureDetector(
        onTap: () => genderProvider.toogleGender(index),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          decoration: BoxDecoration(
            color: ref.watch(bmiProvider).getGender == index
                ? Colors.indigo[800]
                : Colors.indigo,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Icon(
                _icon,
                size: 60,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                _gender,
                style: const TextStyle(fontSize: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
