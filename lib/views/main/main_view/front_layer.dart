import 'package:bmi_calculator/enums/gender_type.dart';
import 'package:bmi_calculator/views/components/main_view/age_widget.dart';
import 'package:bmi_calculator/views/components/main_view/height_widget.dart';
import 'package:bmi_calculator/views/components/main_view/weightWidget.dart';
import 'package:flutter/material.dart';

import '../../components/main_view/calculate_button_widget.dart';
import '../../components/main_view/gender_widget.dart';

class FrontLayer extends StatelessWidget {
  const FrontLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
        ),
        child: Column(
          children: [
            Row(
              children: const [
                GenderWidget(
                  gender: 'Male',
                  icon: Icons.male,
                  genderType: GenderType.male,
                ),
                SizedBox(
                  width: 15,
                ),
                GenderWidget(
                  gender: 'Female',
                  icon: Icons.female,
                  genderType: GenderType.female,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const HeightWidget(),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: const [
                AgeWidget(),
                SizedBox(
                  width: 10,
                ),
                WeightWidget(),
              ],
            ),
            const CalculateButtonWidget(),
          ],
        ),
      ),
    );
  }
}
