import 'package:bmi_calculator/views/components/main_view/height_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  testWidgets(
    'Height Widget Testing',
    (widgetTester) async {
      // create widget
      await widgetTester.pumpWidget(
        ProviderScope(
          overrides: const [],
          child: MaterialApp(
            home: Scaffold(
              body: Column(
                children: const [
                  HeightWidget(),
                ],
              ),
            ),
          ),
        ),
      );

      // verify that height field starts at 165.0
      expect(find.text('165.0'), findsOneWidget);

      // find height slider
      final heightSlider = find.byKey(const Key('height_slider'));
      await widgetTester.pump();

      expect(heightSlider, findsOneWidget);

      // drag height slider
      await widgetTester.drag(heightSlider, const Offset(10, 0));
      await widgetTester.pumpAndSettle();

      // verify that height slider is updated
      expect(find.text('165.0'), findsNothing);
    },
  );
}
