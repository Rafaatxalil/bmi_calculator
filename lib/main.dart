import 'package:bmi_calculator/age.dart';
import 'package:bmi_calculator/bmi_calculator.dart';
import 'package:bmi_calculator/gender.dart';
import 'package:bmi_calculator/height.dart';
import 'package:bmi_calculator/weight.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(bmiProvider);
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text('BMI CALCULATOR'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
        ),
        child: Column(
          children: [
            Row(
              children: const [
                Gender('Male', Icons.male, 0),
                SizedBox(
                  width: 15,
                ),
                Gender('Female', Icons.female, 1),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Height(),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: const [
                Age(),
                SizedBox(
                  width: 10,
                ),
                Weight(),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 75,
        color: Colors.red[900],
        child: GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (_) => Padding(
                padding: const EdgeInsets.all(10),
                child: AlertDialog(
                  title:
                      Text('Your BMI is: ${provider.bmi.toStringAsFixed(2)}'),
                  content: Text(
                    provider.interpretateBMI(),
                  ),
                ),
              ),
            );
          },
          child: const Center(
              child: Text(
            'Calculate your BMI',
            style: TextStyle(
              fontSize: 30,
            ),
          )),
        ),
      ),
    );
  }
}
