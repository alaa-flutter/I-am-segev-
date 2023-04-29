import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/theme_provider.dart';

class ColorTheme {
  BuildContext context;
  ColorTheme(this.context);
  bool get getTheme => Provider.of<ThemeProvider>(context).isDarkMode;
  Color get color => getTheme
      ? Colors.white
      : Colors.black;
}
