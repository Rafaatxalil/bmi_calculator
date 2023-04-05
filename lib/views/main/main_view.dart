import 'package:backdrop/backdrop.dart';
import 'package:bmi_calculator/views/main/main_view/back_layer.dart';
import 'package:bmi_calculator/views/main/main_view/front_layer.dart';
import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
      headerHeight: MediaQuery.of(context).size.height * 0.65,
      appBar: BackdropAppBar(
        title: const Text(
          'BMI Calculator',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        leading: const BackdropToggleButton(
          icon: AnimatedIcons.arrow_menu,
        ),
      ),
      frontLayerScrim: Colors.white.withOpacity(0.0),
      backLayer: const BackLayer(),
      frontLayer: const FrontLayer(),
    );
  }
}
