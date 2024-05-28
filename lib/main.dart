import 'package:dark_mode/home_screen.dart';
import 'package:dark_mode/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'themes.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Dark Mode App',
          theme: themeProvider.isDarkMode ? darkTheme : lightTheme,
          home: const HomeScreen(),
        );
      },
    );
  }
}





