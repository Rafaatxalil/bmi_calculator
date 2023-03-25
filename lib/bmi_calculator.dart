import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BmiCalculator extends ChangeNotifier {
  double bmi = 0;
  int height = 150;
  int weight = 55;
  int age = 30;
  int genderIndex = 0;

  void setHeight(int heightcm) {
    height = heightcm;
    notifyListeners();
  }

  void addAge() {
    age++;
    notifyListeners();
  }

  void subAge() {
    age--;
    notifyListeners();
  }

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

  get getBMI => bmi;
  get getHeight => height;
  get getAge => age;
  get getWeight => weight;
  get getGender => genderIndex;

  void calculateBMI() {
    double bmiCalculation =
        (weight / pow(height / 100, 2)) + (genderIndex * 1.5) - (age * 0.04);
    bmi = bmiCalculation;
  }

  String interpretateBMI() {
    calculateBMI();
    if (bmi >= 25) {
      return 'You have a higher body weight than normal, Try to exercise';
    } else if (bmi > 20) {
      return 'You have a normal body weight, good job';
    } else {
      return 'You have a lower body weight than normal, Try eat more';
    }
  }
}

final bmiProvider = ChangeNotifierProvider(
  (ref) => BmiCalculator(),
);
