import 'package:bmi_calculator/state/theme/provider/theme_provider.dart';
import 'package:bmi_calculator/views/main/main_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import './state/theme/models/theme.dart' as th;

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  final String title = 'T';
  final String message = 'M';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    return MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      theme: th.Theme.lightTheme,
      darkTheme: th.Theme.darkTheme,
      themeMode: theme,
      home: const MainView(),
    );
  }
}
