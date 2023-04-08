import 'package:bmi_calculator/views/components/main_view/weightWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  testWidgets(
    'Weight Widget Test',
    (WidgetTester widgetTester) async {
      //create widget
      await widgetTester.pumpWidget(
        ProviderScope(
          overrides: const [],
          child: MaterialApp(
            home: Scaffold(
              body: Column(
                children: const [
                  WeightWidget(),
                ],
              ),
            ),
          ),
        ),
      );

      // verify that Weight field starts at 70.0
      expect(find.text('70.0'), findsOneWidget);

      // find weight increment button
      await widgetTester.pump();
      final weightIncrement = find.byKey(const Key('weight_increment'));

      expect(weightIncrement, findsOneWidget);

      // tap weight increment button 5 times
      for (var i = 0; i < 5; i++) {
        await widgetTester.tap(weightIncrement);
      }
      await widgetTester.pumpAndSettle();

      // verify that weight field is now 75.0
      expect(find.text('75.0'), findsOneWidget);

      // find weight decrement button
      final weightDecrement = find.byKey(const Key('weight_decrement'));

      expect(weightDecrement, findsOneWidget);

      // tap weight decrement button 5 times
      for (var i = 0; i < 5; i++) {
        await widgetTester.tap(weightDecrement);
      }
      await widgetTester.pumpAndSettle();

      // verify that weight field is now 70.0
      expect(find.text('70.0'), findsOneWidget);

      // find weight field
      final weightField = find.byKey(const Key('weight_input'));

      // tap weight field
      await widgetTester.enterText(weightField, '65.9');

      // verify that weight field is now 65.9
      expect(find.text('65.9'), findsOneWidget);
    },
  );
}
