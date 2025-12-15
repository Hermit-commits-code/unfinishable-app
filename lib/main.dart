// lib/main.dart

import 'package:flutter/material.dart';

import 'screens/archive_screen.dart';
// Import our placeholder screens (we will create these files next)
import 'screens/games_screen.dart';
import 'screens/settings_screen.dart';

void main() {
  runApp(const UnfinishableApp());
}

class UnfinishableApp extends StatelessWidget {
  const UnfinishableApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unfinishable App',
      theme: ThemeData(
        // We'll define the calm, soothing colors later in 0.4
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily:
            'OpenSans', // Placeholder, we'll configure a custom font later
      ),
      home: const MainNavigator(),
    );
  }
}

class MainNavigator extends StatefulWidget {
  const MainNavigator({super.key});

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const GamesScreen(), // Index 0: Where the games are played
    const ArchiveScreen(), // Index 1: Where the logs are stored
    const SettingsScreen(), // Index 2: App configurations
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // We are deliberately leaving the AppBar out of the Scaffold for a cleaner look.
      // The individual screens (GamesScreen) will have their own titles/headers if needed.
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        selectedItemColor: Colors.indigo, // Use the primary color
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.gamepad_outlined),
            label: 'Games',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive_outlined),
            label: 'Archive',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
