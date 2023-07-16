import 'package:digiguard/constants/ui_constants.dart';
import 'package:digiguard/data/reader/image_reader.dart';
import 'package:digiguard/data/reader/level_reader.dart';
import 'package:digiguard/data/reader/question_reader.dart';
import 'package:digiguard/data/storage/local_storage.dart';
import 'package:digiguard/ui/screen/quiz_screen.dart';
import 'package:digiguard/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await performInitializations();
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

Future<void> performInitializations() async {
  // Note order is important in these initializations.
  // The resoures that are dependent on other resources
  // should be placed below them.
  await LocalStorage.initializeLocalStorage();

  await LevelReader.initLevelInfo(
    UiConstants.defaultLocale,
  );

  await QuestionReader.initQuestionData(
    UiConstants.defaultLocale,
    LocalStorage.getCurrentLevelId(),
  );

  await ImageReader.initImages();
}
