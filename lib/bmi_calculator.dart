import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BmiCalculator extends ChangeNotifier {
  double bmi = 0;
  int height = 0;
  int weight = 0;
  int age = 0;
  int genderIndex = 0;

  void setHeight(int heightcm) {
    height = heightcm;
    notifyListeners();
  }

  get getHeight => height;

  void addAge() {
    age++;
    notifyListeners();
  }

  void subAge() {
    age--;
    notifyListeners();
  }

  get getAge => age;

  void addWeight() {
    weight++;
    notifyListeners();
  }

  void subWeight() {
    weight--;
    notifyListeners();
  }

  void toogleGender(int gIndex) {
    genderIndex = gIndex;
    notifyListeners();
  }

  get getWeight => weight;
  get getGender => genderIndex;

  double calculateBMI() {
    double bmi =
        (weight / pow(height / 100, 2)) + (genderIndex * 1.5) - (age * 0.04);
    return bmi;
  }

  String interpretateBMI() {
    bmi = calculateBMI();
    if (bmi >= 25) {
      return 'You have a higher body weight than normal, Try to exercise';
    } else if (bmi >= 18) {
      return 'You have a normal body weight, good job';
    } else {
      return 'You have a lower body weight than normal, Try eat more';
    }
  }
}

final bmiProvider = ChangeNotifierProvider(
  (ref) => BmiCalculator(),
);
