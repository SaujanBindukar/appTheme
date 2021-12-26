import 'package:apptheme/theme/app_theme.dart';
import 'package:apptheme/theme/change_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(changeTheme);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: currentTheme.darkMode ? ThemeMode.dark : ThemeMode.light,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.read(changeTheme).darkMode;
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: theme.backgroundColor,
        title: Text(
          'App Theming',
          style: theme.textTheme.headline6,
        ),
      ),
      body: Center(
        child: Text(
          isDarkMode ? 'Dark Mode' : 'Light Mode',
          style: theme.textTheme.headline6,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: theme.primaryColor,
        onPressed: () {
          if (isDarkMode) {
            ref.read(changeTheme.notifier).enableLightMode();
          } else {
            ref.read(changeTheme.notifier).enableDarkMode();
          }
        },
        child: Icon(
          isDarkMode ? Icons.dark_mode : Icons.light_mode,
        ),
      ),
    );
  }
}
