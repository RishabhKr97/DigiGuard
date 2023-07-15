import 'package:digiguard/ui/screen/quiz_screen.dart';
import 'package:digiguard/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.defaultAppTheme,
      themeMode: ThemeMode.light,
      home: QuizScreen(),
    );
  }
}
