import 'package:bmi_calculator/enums/gender_type.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
class BmiModel {
  final double bmi;
  final int age;
  final double height;
  final double weight;
  final GenderType gernderType;

  const BmiModel({
    required this.bmi,
    required this.age,
    required this.height,
    required this.weight,
    required this.gernderType,
  });

  BmiModel copyWith({
    double? bmi,
    int? age,
    double? height,
    double? weight,
    GenderType? gernderType,
  }) {
    return BmiModel(
      bmi: bmi ?? this.bmi,
      age: age ?? this.age,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      gernderType: gernderType ?? this.gernderType,
    );
  }
}
