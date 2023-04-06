import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../state/bmi/providers/bmi_provider.dart';

class AgeWidget extends StatefulHookConsumerWidget {
  const AgeWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AgeWidgetState();
}

class _AgeWidgetState extends ConsumerState<AgeWidget> {
  @override
  Widget build(BuildContext context) {
    final ageController = useTextEditingController();
    useEffect(() {
      ageController.text = ref.watch(bmiProvider).age.toString();
      return null;
    }, [ref.watch(bmiProvider).age]);
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

            TextField(
              key: const ValueKey('age_input'),
              controller: ageController,
              onSubmitted: (value) {
                bmi.setAge(int.parse(value));
              },
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
              ),
            ),
            // Text(
            //   ref.watch(bmiProvider).age.toString(),
            //   style: Theme.of(context).textTheme.titleLarge,
            // ),
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
