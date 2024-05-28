import 'package:dark_mode/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dark Mode App'),
        actions: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(
                scale: animation,
                child: child,
              );
            },
            child: Provider.of<ThemeProvider>(context).isDarkMode
                ? IconButton(
              key: const Key("dark"),
              icon: const RotationTransition(
                turns: AlwaysStoppedAnimation(0 / 360),
                child: Icon(
                  Icons.nightlight_round,
                  size: 40,
                  color: Colors.yellow, // Customize color as needed
                ),
              ),
              onPressed: () {
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleDarkMode();
              },
            )
                : IconButton(
              key: const Key("light"),
              icon: const RotationTransition(
                turns: AlwaysStoppedAnimation(180 / 360),
                child: Icon(
                  Icons.wb_sunny,
                  size: 40,
                  color: Colors.orange, // Customize color as needed
                ),
              ),
              onPressed: () {
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleDarkMode();
              },
            ),
          ),
        ],
      ),
      body: const Center(
        child: Text('Hello, World!'),
      ),
    );
  }
}