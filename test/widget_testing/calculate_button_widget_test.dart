import 'package:bmi_calculator/views/components/main_view/calculate_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  testWidgets(
    'Calulate Button Widget tesing',
    (widgetTester) async {
      // create widget
      await widgetTester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Column(
                children: const [
                  CalculateButtonWidget(),
                ],
              ),
            ),
          ),
        ),
      );

      // verify that calculate button is visible
      expect(find.text('Calculate'), findsOneWidget);

      // find calculate button
      final calculateButton = find.byKey(const Key('calculate_button'));
      await widgetTester.pump();

      expect(calculateButton, findsOneWidget);

      // tap calculate button
      await widgetTester.tap(calculateButton);
      await widgetTester.pumpAndSettle();
    },
  );
}
