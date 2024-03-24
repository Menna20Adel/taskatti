import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskatti/core/services/local_storage.dart';
import 'package:taskatti/core/themes/themes.dart';
import 'package:taskatti/features/add_task/data/task_model.dart';
import 'package:taskatti/features/splash_view.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox('user');
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>('task');
  AppLocalStorage().init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Hive.box('user').listenable(),
        builder: (context, box, child) {
          bool darkMode = box.get('darkMode', defaultValue: false);
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,

              //light theme
              theme: AppThemes.appLightTheme,

              //dark theme
              darkTheme: AppThemes.appDarkTheme,

              //home
              home: const SplashView());
        });
  }
}
