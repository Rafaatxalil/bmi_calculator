import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:bmi_calculator/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets(
    'theme_mode',
    (widgetTester) async {
      app.main();
      await widgetTester.pumpAndSettle();

      // find segmented button
      final measurementButton =
          find.byKey(const ValueKey('measurement_button'));
      final backDropButton = find.byKey(const ValueKey('backdrop_button'));

      await widgetTester.tap(backDropButton);

      await Future.delayed(const Duration(seconds: 2));

      await widgetTester.tap(measurementButton);

      await Future.delayed(const Duration(seconds: 2));
      await widgetTester.tap(backDropButton);
      await Future.delayed(const Duration(seconds: 2));
      await widgetTester.tap(backDropButton);
      await Future.delayed(const Duration(seconds: 2));
      await widgetTester.tap(measurementButton);
      await Future.delayed(const Duration(seconds: 2));
    },
  );
}
