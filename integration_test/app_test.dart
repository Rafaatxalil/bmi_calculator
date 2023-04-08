// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:integration_test/integration_test.dart';
// import 'package:bmi_calculator/main.dart' as app;

// void main() {
//   IntegrationTestWidgetsFlutterBinding.ensureInitialized();

//   testWidgets(
//     'calculate bmi for a normal person',
//     (widgetTester) async {
//       //setup
//       app.main();
//       await widgetTester.pumpAndSettle();

//       // final heightSlider = find.byKey(const Key('height_slider'));

//       //do
//       await widgetTester.drag(
//           find.byKey(const Key('height_slider')), const Offset(90, 0));
//       await Future.delayed(const Duration(seconds: 1));
//       // await widgetTester.tap(maleButton);
//       await Future.delayed(const Duration(seconds: 4));
//       await widgetTester.pumpAndSettle();

//       //verify
//       await Future.delayed(const Duration(seconds: 1));
//     },
//   );
// }
