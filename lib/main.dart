import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_switcher_using_provider/Provider/theme-changer-provider.dart';
import 'package:theme_switcher_using_provider/Screens/ThemeChanging_radiotiles.dart';
import 'package:theme_switcher_using_provider/Screens/ThemeChanging_toggle.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ThemeChangerProvider(),
          ),
        ],
        child: Builder(builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeChangerProvider>(context);
          return MaterialApp(
            title: "Theme Changer Using Provider",
            themeMode: themeChanger.thememode,
            theme: ThemeData(
              brightness: Brightness.light,
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
            ),
            home: ThemeChangerToggle(),
          );
        }));
  }
}
