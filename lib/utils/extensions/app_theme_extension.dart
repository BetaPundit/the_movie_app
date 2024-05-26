import 'package:flutter/material.dart';

/// Extension on BuildContext for retrieving theme data
extension AppThemeDataExtension on BuildContext {
  /// Retrieve material design theme data
  ThemeData get themeData => Theme.of(this);
}
