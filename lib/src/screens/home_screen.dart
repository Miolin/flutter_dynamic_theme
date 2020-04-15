import 'package:flutter/material.dart';
import 'package:flutter_dynamic_theme/src/resources/app_strings.dart';
import 'package:flutter_dynamic_theme/src/resources/theme_controller.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _onRegenerateThemePressed(context);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.appName),
        ),
        body: Center(
          child: Text(
            AppStrings.heyThere,
            style: Theme.of(context).primaryTextTheme.subtitle,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.sync),
          onPressed: () {
            _onRegenerateThemePressed(context);
          },
        ),
      ),
    );
  }

  void _onRegenerateThemePressed(BuildContext context) {
    RandomThemeBuilder.of(context).regenerateTheme();
  }
}
