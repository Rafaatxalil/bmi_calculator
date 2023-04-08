import 'package:bmi_calculator/state/theme/notifires/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ThemeNotifier sut;

  // setUp
  setUp(() {
    sut = ThemeNotifier();
  });

  //test 1
  test('initial state is dark', () {
    expect(sut.state, ThemeMode.dark);
  });

  //test 2
  test('themeMode method changes sets the state to the desired theme mode', () {
    //dark mode
    sut.themeMode = ThemeMode.dark;
    expect(sut.state, ThemeMode.dark);

    //light mode
    sut.themeMode = ThemeMode.light;
    expect(sut.state, ThemeMode.light);
  });
}
