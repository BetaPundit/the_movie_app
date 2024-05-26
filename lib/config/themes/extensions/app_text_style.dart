import 'package:flutter/material.dart';

@immutable
class AppTextStyle extends ThemeExtension<AppTextStyle> {
  // Fields
  /// For default text styles refer: https://api.flutter.dev/flutter/material/TextTheme-class.html

  final TextStyle headlineLarge;
  final TextStyle headlineMedium;
  final TextStyle headlineSmall;

  final TextStyle titleLarge;
  final TextStyle titleMedium;
  final TextStyle titleSmall;

  final TextStyle labelLarge;
  final TextStyle labelMedium;
  final TextStyle labelSmall;

  final TextStyle bodyLarge;
  final TextStyle bodyMedium;
  final TextStyle bodySmall;

  // Constructor
  const AppTextStyle({
    required this.headlineLarge,
    required this.headlineMedium,
    required this.headlineSmall,
    required this.titleLarge,
    required this.titleMedium,
    required this.titleSmall,
    required this.labelLarge,
    required this.labelMedium,
    required this.labelSmall,
    required this.bodyLarge,
    required this.bodyMedium,
    required this.bodySmall,
  });

  @override
  AppTextStyle copyWith({
    TextStyle? headlineLarge,
    TextStyle? headlineMedium,
    TextStyle? headlineSmall,
    TextStyle? headline4,
    TextStyle? titleLarge,
    TextStyle? titleMedium,
    TextStyle? titleSmall,
    TextStyle? pageTitle,
    TextStyle? labelLarge,
    TextStyle? labelMedium,
    TextStyle? labelSmall,
    TextStyle? bodyLarge,
    TextStyle? bodyMedium,
    TextStyle? bodySmall,
  }) {
    return AppTextStyle(
      headlineLarge: headlineLarge ?? this.headlineLarge,
      headlineMedium: headlineMedium ?? this.headlineMedium,
      headlineSmall: headlineSmall ?? this.headlineSmall,
      titleLarge: titleLarge ?? this.titleLarge,
      titleMedium: titleMedium ?? this.titleMedium,
      titleSmall: titleSmall ?? this.titleSmall,
      labelLarge: labelLarge ?? this.labelLarge,
      labelMedium: labelMedium ?? this.labelMedium,
      labelSmall: labelSmall ?? this.labelSmall,
      bodyLarge: bodyLarge ?? this.bodyLarge,
      bodyMedium: bodyMedium ?? this.bodyMedium,
      bodySmall: bodySmall ?? this.bodySmall,
    );
  }

  // Controls how it displays when the instance is being passed
  // to the `print()` method.
  @override
  String toString() => 'BrokingTextStyle('
      'headlineLarge: $headlineLarge, headlineMedium: $headlineMedium, headlineSmall: $headlineSmall, bodyLarge: $bodyLarge, bodyMedium: $bodyMedium, bodySmall: $bodySmall, labelLarge: $labelLarge, labelMedium: $labelMedium, labelSmall: $labelSmall, titleLarge: $titleLarge, titleMedium: $titleMedium, titleSmall: $titleSmall'
      ')';

  static const _defaultFontFamily = 'Lato';

  static const _headlineLarge = TextStyle(
    fontFamily: _defaultFontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 30.0,
    color: Colors.black,
  );

  static const _headlineMedium = TextStyle(
    fontFamily: _defaultFontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 28.0,
    color: Colors.black,
  );

  static const _headlineSmall = TextStyle(
    fontFamily: _defaultFontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 26.0,
    color: Colors.black,
  );

  static const _titleLarge = TextStyle(
    fontFamily: _defaultFontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 24.0,
    color: Colors.black,
  );

  static const _titleMedium = TextStyle(
    fontFamily: _defaultFontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 20.0,
    color: Colors.black,
  );

  static const _titleSmall = TextStyle(
    fontFamily: _defaultFontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 18.0,
    color: Colors.black,
  );

  static const _bodyLarge = TextStyle(
    fontFamily: _defaultFontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 16.0,
    color: Colors.black,
  );

  static const _bodyMedium = TextStyle(
    fontFamily: _defaultFontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 14.0,
    color: Colors.black,
  );

  static const _bodySmall = TextStyle(
    fontFamily: _defaultFontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 12.0,
    color: Colors.black,
  );

  static const _labelLarge = TextStyle(
    fontFamily: _defaultFontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 16.0,
    color: Colors.black,
  );

  static const _labelMedium = TextStyle(
    fontFamily: _defaultFontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 14.0,
    color: Colors.black,
  );

  static const _labelSmall = TextStyle(
    fontFamily: _defaultFontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 12.0,
    color: Colors.black,
  );

  // the light theme
  static const light = AppTextStyle(
    headlineLarge: _headlineLarge,
    headlineMedium: _headlineMedium,
    headlineSmall: _headlineSmall,
    titleLarge: _titleLarge,
    titleMedium: _titleMedium,
    titleSmall: _titleSmall,
    bodyLarge: _bodyLarge,
    bodyMedium: _bodyMedium,
    bodySmall: _bodySmall,
    labelLarge: _labelLarge,
    labelMedium: _labelMedium,
    labelSmall: _labelSmall,
  );

  // the dark theme
  static AppTextStyle dark = light.copyWith(
    headlineLarge: _headlineLarge.copyWith(color: Colors.white),
    headlineMedium: _headlineMedium.copyWith(color: Colors.white),
    headlineSmall: _headlineSmall.copyWith(color: Colors.white),
    titleLarge: _titleLarge.copyWith(color: Colors.white),
    titleMedium: _titleMedium.copyWith(color: Colors.white),
    titleSmall: _titleSmall.copyWith(color: Colors.white),
    labelLarge: _labelLarge.copyWith(color: Colors.white),
    labelMedium: _labelMedium.copyWith(color: Colors.white),
    labelSmall: _labelSmall.copyWith(color: Colors.white),
    bodyLarge: _bodyLarge.copyWith(color: Colors.white),
    bodyMedium: _bodyMedium.copyWith(color: Colors.white),
    bodySmall: _bodySmall.copyWith(color: Colors.white),
  );

  @override
  ThemeExtension<AppTextStyle> lerp(
      ThemeExtension<AppTextStyle>? other, double t) {
    if (other is! AppTextStyle) {
      return this;
    }
    return AppTextStyle(
      headlineLarge: TextStyle.lerp(headlineLarge, other.headlineLarge, t)!,
      headlineMedium: TextStyle.lerp(headlineMedium, other.headlineMedium, t)!,
      headlineSmall: TextStyle.lerp(headlineSmall, other.headlineSmall, t)!,
      titleLarge: TextStyle.lerp(titleLarge, other.titleLarge, t)!,
      titleMedium: TextStyle.lerp(titleMedium, other.titleMedium, t)!,
      titleSmall: TextStyle.lerp(titleSmall, other.titleSmall, t)!,
      labelLarge: TextStyle.lerp(labelLarge, other.labelLarge, t)!,
      labelMedium: TextStyle.lerp(labelMedium, other.labelMedium, t)!,
      labelSmall: TextStyle.lerp(labelSmall, other.labelSmall, t)!,
      bodyLarge: TextStyle.lerp(bodyLarge, other.bodyLarge, t)!,
      bodyMedium: TextStyle.lerp(bodyMedium, other.bodyMedium, t)!,
      bodySmall: TextStyle.lerp(bodySmall, other.bodySmall, t)!,
    );
  }
}
