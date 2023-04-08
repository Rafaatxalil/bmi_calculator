import 'package:bmi_calculator/views/components/main_view/age_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  testWidgets(
    'Age Widget Test',
    (
      WidgetTester widgetTester,
    ) async {
      //create widget
      await widgetTester.pumpWidget(
        ProviderScope(
          overrides: const [],
          child: MaterialApp(
            home: Scaffold(
              body: Column(
                children: const [
                  AgeWidget(),
                ],
              ),
            ),
          ),
        ),
      );

      // verify that age field starts at 25
      expect(find.text('25'), findsOneWidget);

      // find age increment button
      await widgetTester.pump();
      final ageIncrement = find.byKey(const Key('age_increment'));

      expect(ageIncrement, findsOneWidget);

      // tap age increment button 5 times
      for (var i = 0; i < 5; i++) {
        await widgetTester.tap(ageIncrement);
      }
      await widgetTester.pumpAndSettle();

      // verify that age field is now 30
      expect(find.text('30'), findsOneWidget);

      // find age decrement button
      final ageDecrement = find.byKey(const Key('age_decrement'));

      expect(ageDecrement, findsOneWidget);

      // tap age decrement button 5 times
      for (var i = 0; i < 5; i++) {
        await widgetTester.tap(ageDecrement);
      }
      await widgetTester.pumpAndSettle();

      // verify that age field is now 20
      expect(find.text('25'), findsOneWidget);

      // find age field
      final ageField = find.byKey(const Key('age_input'));

      // tap age field
      await widgetTester.enterText(ageField, '40');

      // verify that age field is now 40
      expect(find.text('40'), findsOneWidget);
    },
  );
}
