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
      final themeSwitch = find.byKey(const ValueKey('theme_switch'));
      final backDropButton = find.byKey(const ValueKey('backdrop_button'));

      await widgetTester.tap(backDropButton);

      await Future.delayed(const Duration(seconds: 2));

      await widgetTester.tap(themeSwitch);

      await Future.delayed(const Duration(seconds: 2));
      await widgetTester.tap(backDropButton);
      await Future.delayed(const Duration(seconds: 2));
      await widgetTester.tap(backDropButton);
      await Future.delayed(const Duration(seconds: 2));
      await widgetTester.tap(themeSwitch);
      await Future.delayed(const Duration(seconds: 2));
    },
  );
}
