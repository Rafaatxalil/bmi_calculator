import 'package:bmi_calculator/bmi_calculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late BmiCalculator sut;

  //setup
  setUp(
    () {
      sut = BmiCalculator();
    },
  );

  //test 1
  test(
    'Initial values are correct, and getters work correctly',
    () {
      expect(sut.getAge, 30);
      expect(sut.getBMI, 0);
      expect(sut.getGender, 0);
      expect(sut.getHeight, 150);
      expect(sut.getWeight, 55);
    },
  );

  //test 2
  group('Testing setters and getters', () {
    int getHeight() {
      sut.setHeight(160);
      return 160;
    }

    int addWeight() {
      sut.addWeight();
      int weight = sut.getWeight;
      return weight;
    }

    int subWeight() {
      sut.subWeight();
      int weight = sut.getWeight;
      return weight;
    }

    int addAge() {
      sut.addAge();
      int age = sut.getAge;
      return age;
    }

    int subAge() {
      sut.subAge();
      int age = sut.getAge;
      return age;
    }

    int getGenderIndex() {
      sut.toogleGender(1);
      int index = sut.getGender;
      return index;
    }

    test('Ensuring that setters work correctly', () {
      expect(getHeight(), 160);
      expect(getGenderIndex(), 1);
    });

    test('Testing add and sub functionality for age and weight', () {
      expect(addWeight(), 56);
      expect(subWeight(), 55);
      expect(addAge(), 31);
      expect(subAge(), 30);
    });
  });

  //test 3
  test('Testing that BMI is calculated correctly', () {
    String bmiCalculator() {
      sut.setHeight(160);
      sut.addAge(); // 31
      sut.addWeight(); // 56
      sut.toogleGender(1); //female
      sut.calculateBMI();
      String result = sut.getBMI.toStringAsFixed(2);
      return result;
    }

    expect(bmiCalculator(), '22.13');
  });

  group('Making sure that BMI interpretations are correct', () {
    String interpretBMI(int height) {
      sut.setHeight(height);
      sut.addAge(); // 31
      sut.addWeight(); // 56
      sut.toogleGender(1); //female
      String result = sut.interpretateBMI();
      return result;
    }

    test('For higher body weight', () {
      expect(interpretBMI(148),
          'You have a higher body weight than normal, Try to exercise');
    });

    test('For normal body weight', () {
      expect(interpretBMI(155), 'You have a normal body weight, good job');
    });

    test('For lower body weight', () {
      expect(interpretBMI(170),
          'You have a lower body weight than normal, Try eat more');
    });
  });
}
