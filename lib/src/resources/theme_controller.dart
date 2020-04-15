import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dynamic_theme/src/utils/color_generator.dart';

typedef Widget ThemeDataBuilder(BuildContext context, ThemeData themeData);

class ThemeController {
  final ThemeData _initialTheme;
  final StreamController<ThemeData> _themeStreamController = StreamController();

  ThemeController(this._initialTheme) {
    _themeStreamController.add(_initialTheme);
  }

  Stream<ThemeData> get themeStream => _themeStreamController.stream;

  void setThemeData(ThemeData theme) {
    _themeStreamController.add(theme);
  }

  void dispose() {
    _themeStreamController.close();
  }
}

class RandomThemeBuilder extends StatefulWidget {
  final ThemeDataBuilder builder;
  final ThemeData initialTheme;

  const RandomThemeBuilder({
    Key key,
    @required this.builder,
    @required this.initialTheme,
  }) : super(key: key);

  @override
  RandomThemeBuilderState createState() => RandomThemeBuilderState();

  static RandomThemeBuilderState of(BuildContext context) {
    assert(context != null);
    return context.findAncestorStateOfType<RandomThemeBuilderState>();
  }
}

class RandomThemeBuilderState extends State<RandomThemeBuilder> {
  ThemeController _themeController;

  @override
  void initState() {
    _themeController = ThemeController(widget.initialTheme);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ThemeData>(
      initialData: widget.initialTheme,
      stream: _themeController.themeStream,
      builder: (context, snapshot) => widget.builder(context, snapshot.data),
    );
  }

  void regenerateTheme() {
    final primaryColor = ColorGenerator.getRandomColor();
    final theme = ThemeData(
      primaryColor: primaryColor,
      canvasColor: primaryColor,
      accentColor: ColorGenerator.getRandomColor(),
    );
    
    _themeController.setThemeData(theme);
  }

  @override
  void dispose() {
    _themeController.dispose();
    super.dispose();
  }
}
