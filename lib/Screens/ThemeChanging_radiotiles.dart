import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_switcher_using_provider/Provider/theme-changer-provider.dart';

class ThemeChanger extends StatefulWidget {
  const ThemeChanger({super.key});

  @override
  State<ThemeChanger> createState() => _ThemeChanger();
}

class _ThemeChanger extends State<ThemeChanger> {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChangerProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme Changer"),
      ),
      body: Center(
          child: Column(
        children: [
          RadioListTile<ThemeMode>(
              title: Text("Light"),
              value: ThemeMode.light,
              groupValue: themeChanger.thememode,
              onChanged: themeChanger.setTheme),
          RadioListTile<ThemeMode>(
              title: Text("Dark"),
              value: ThemeMode.dark,
              groupValue: themeChanger.thememode,
              onChanged: themeChanger.setTheme),
          RadioListTile<ThemeMode>(
              title: Text("system"),
              value: ThemeMode.system,
              groupValue: themeChanger.thememode,
              onChanged: themeChanger.setTheme),
        ],
      )),
    );
  }
}
