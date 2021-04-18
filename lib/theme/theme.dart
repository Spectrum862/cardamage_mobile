class ThemeProvider {
  static final ThemeProvider _singleton = ThemeProvider._internal();
  String currentMode = 'light';

  factory ThemeProvider() {
    return _singleton;
  }

  ThemeProvider._internal();
}
