// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/cryptocurrency_viewmodel.dart';
import 'views/home_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const AtividadeFlutter());
}

class AtividadeFlutter extends StatefulWidget {
  const AtividadeFlutter({super.key});

  @override
  State<AtividadeFlutter> createState() => _AtividadeFlutterState();
}

class _AtividadeFlutterState extends State<AtividadeFlutter> {
  ThemeMode _themeMode = ThemeMode.system;

  void toggleTheme() {
    setState(() {
      if (_themeMode == ThemeMode.light) {
        _themeMode = ThemeMode.dark;
      } else {
        _themeMode = ThemeMode.light;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CryptocurrencyViewModel()),
        Provider.value(value: toggleTheme),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Criptomoedas',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: _themeMode,
        home: const HomeScreen(),
      ),
    );
  }
}
