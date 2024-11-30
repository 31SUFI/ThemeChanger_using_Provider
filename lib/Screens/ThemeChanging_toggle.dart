import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_switcher_using_provider/Provider/theme-changer-provider.dart';

class ThemeChangerToggle extends StatefulWidget {
  const ThemeChangerToggle({super.key});

  @override
  State<ThemeChangerToggle> createState() => _ThemeChangerToggle();
}

class _ThemeChangerToggle extends State<ThemeChangerToggle> {
  @override
  Widget build(BuildContext context) {
    // Access the ThemeChangerProvider inside the build method
    final themeChanger = Provider.of<ThemeChangerProvider>(context);

    // Map ThemeMode to the index of the toggle buttons
    // final selectedIndex = {
    //   ThemeMode.light: 0,
    //   ThemeMode.dark: 1,
    //   ThemeMode.system: 2,
    // }[themeChanger.thememode];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme Changer"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ToggleButtons(
              isSelected: [
                themeChanger.thememode == ThemeMode.light,
                themeChanger.thememode == ThemeMode.dark,
                themeChanger.thememode == ThemeMode.system,
              ],
              onPressed: (index) {
                // Set theme based on the selected toggle index
                final modes = [
                  ThemeMode.light,
                  ThemeMode.dark,
                  ThemeMode.system
                ];
                themeChanger.setTheme(modes[index]);
              },
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text("Light"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text("Dark"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text("System"),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Text(
              "Current Theme: ${themeChanger.thememode.name.toUpperCase()}",
              style: const TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
