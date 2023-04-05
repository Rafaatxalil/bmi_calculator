// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// class BmiCalculator extends ChangeNotifier {
//   double bmi = 0;
//   int height = 150;
//   int weight = 55;
//   int age = 30;
//   int genderIndex = 0;

//   void setHeight(int heightcm) {
//     height = heightcm;
//     notifyListeners();
//   }

//   void addAge() {
//     age++;
//     notifyListeners();
//   }

//   void subAge() {
//     age--;
//     notifyListeners();
//   }

//   void addWeight() {
//     weight++;
//     notifyListeners();
//   }

//   void subWeight() {
//     weight--;
//     notifyListeners();
//   }

//   void toogleGender(int gIndex) {
//     genderIndex = gIndex;
//     notifyListeners();
//   }

//   get getBMI => bmi;
//   get getHeight => height;
//   get getAge => age;
//   get getWeight => weight;
//   get getGender => genderIndex;

//   void calculateBMI() {
//     if (age > 0 && weight > 0 && height > 5 && age < 150 && weight <= 600) {
//       double bmiCalculation =
//           (weight / pow(height / 100, 2)) + (genderIndex * 1.5) - (age * 0.04);
//       bmi = bmiCalculation;
//     } else {
//       bmi = 0;
//     }
//   }

//   String interpretateBMI() {
//     if (bmi >= 25) {
//       return 'You have a higher body weight than normal, Try to exercise';
//     } else if (bmi > 20) {
//       return 'You have a normal body weight, good job';
//     } else if (age <= 0 || age > 150) {
//       return 'your age value is invalid try to enter a value greater than 0 less than 150';
//     } else if (weight <= 0 || weight >= 600) {
//       return 'your weight is invalid try to enter a value greater than 0 less than 600';
//     } else if (height <= 5) {
//       return 'your height is invalid try to enter a value greater than 5';
//     } else {
//       return 'You have a lower body weight than normal, Try eat more';
//     }
//   }

//   Future<double> getMyBmi() async {
//     await Future.delayed(const Duration(seconds: 1));
//     return bmi;
//   }

//   Future<int> getMyAge() async {
//     await Future.delayed(const Duration(seconds: 1));
//     return age;
//   }

//   Future<int> getMyHeight() async {
//     await Future.delayed(const Duration(seconds: 1));
//     return height;
//   }

//   Future<int> getMyWeight() async {
//     await Future.delayed(const Duration(seconds: 1));
//     return weight;
//   }

//   Future<int> getMyGender() async {
//     await Future.delayed(const Duration(seconds: 1));
//     return genderIndex;
//   }
// }

// final bmiProvider = ChangeNotifierProvider(
//   (ref) => BmiCalculator(),
// );
