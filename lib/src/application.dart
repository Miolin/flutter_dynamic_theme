import 'package:flutter/material.dart';
import 'package:flutter_dynamic_theme/src/resources/app_strings.dart';
import 'package:flutter_dynamic_theme/src/resources/theme_controller.dart';
import 'package:flutter_dynamic_theme/src/screens/home_screen.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RandomThemeBuilder(
      initialTheme: ThemeData.light(),
      builder: (context, theme) {
        return MaterialApp(
          title: AppStrings.appName,
          theme: theme,
          home: HomeScreen(),
        );
      }
    );
  }
}
