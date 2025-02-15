import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF480C61);
const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
  Colors.purple,
  Color(0xffF44336),
  Color(0xffE91E63),
  Color(0xff9C27B0),
  Color(0xff673AB7),
  Color(0xff3F51B5),
  Color(0xff2196F3),
  Color(0xff03A9F4),
  Color(0xff00BCD4),
  Color(0xff009688),
  Color(0xff4CAF50),
  Color(0xff8BC34A),
  Color(0xffCDDC39),
  Color(0xffFFEB3B),
  Color(0xffFFC107),
  Color(0xffFF9800),
  Color(0xffFF5722),
  Color(0xff795548),
  Color(0xff9E9E9E),
  Color(0xff607D8B),
  Color(0xff000000),
  Color(0xffFFFFFF),
];

class AppTheme {
  final int selectedColor;
  AppTheme({
    this.selectedColor = 0,
  }):assert(
    selectedColor >= 0 && selectedColor < _colorThemes.length,
    'selectedColor must be between 0 and ${_colorThemes.length - 1}',
  );

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
      // brightness: Brightness.dark
    );
  }
}
