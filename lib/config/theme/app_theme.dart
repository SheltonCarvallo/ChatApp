import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF49149F);

const List<Color> _colorThemes = [
  _customColor,
  Color.fromARGB(255, 13, 0, 199),
  Colors.teal,
  Colors.green,
  Colors.black,
  Colors.white,
  Colors.orange
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 2})
      : assert(selectedColor >= 0 && selectedColor <= _colorThemes.length - 1,
            'Color theme must be between 0 and ${_colorThemes.length}');

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true,
        colorSchemeSeed: _colorThemes[selectedColor],
        brightness: Brightness.light);
  }
}
