import 'package:backdrop/backdrop.dart';
import 'package:bmi_calculator/state/theme/provider/theme_provider.dart';
import 'package:bmi_calculator/views/main/main_view/back_layer.dart';
import 'package:bmi_calculator/views/main/main_view/front_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainView extends ConsumerWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BackdropScaffold(
      headerHeight: MediaQuery.of(context).size.height * 0.65,
      appBar: BackdropAppBar(
        title: const Text(
          'BMI Calculator',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        leading: BackdropToggleButton(
          icon: AnimatedIcons.arrow_menu,
          color: ref.watch(themeProvider) == ThemeMode.light
              ? Colors.black
              : Colors.white,
        ),
      ),
      frontLayerScrim: Colors.white.withOpacity(0.0),
      backLayer: const BackLayer(),
      frontLayer: const FrontLayer(),
    );
  }
}
