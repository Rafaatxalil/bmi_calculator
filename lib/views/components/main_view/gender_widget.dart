import 'package:bmi_calculator/enums/gender_type.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../state/bmi/providers/bmi_provider.dart';

class GenderWidget extends ConsumerWidget {
  final String gender;
  final IconData icon;
  final GenderType genderType;
  const GenderWidget({
    required Key key,
    required this.gender,
    required this.icon,
    required this.genderType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bmi = ref.read(bmiProvider.notifier);
    return Expanded(
      child: GestureDetector(
        onTap: () => bmi.setGender(genderType),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            color: ref.watch(bmiProvider).gernderType == genderType
                ? Colors.indigo
                : Colors.indigo[800],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Icon(
                icon,
                size: 80,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                gender,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
