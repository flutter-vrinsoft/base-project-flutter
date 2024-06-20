import 'package:base_project_flutter/export.dart';
import 'package:flutter/material.dart';

extension FastTextStyle on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  TextStyle get bodySmall => textTheme.bodySmall!;
  TextStyle get bodyMedium => textTheme.bodyMedium!;
  TextStyle get bodyLarge => textTheme.bodyLarge!;
  TextStyle get labelSmall => textTheme.labelSmall!;
  TextStyle get labelMedium => textTheme.labelMedium!;
  TextStyle get labelLarge => textTheme.labelLarge!;
  TextStyle get titleSmall => textTheme.titleSmall!;
  TextStyle get titleMedium => textTheme.titleMedium!;
  TextStyle get titleLarge => textTheme.titleLarge!;
  TextStyle get headlineSmall => textTheme.headlineSmall!;
  TextStyle get headlineMedium => textTheme.headlineMedium!;
  TextStyle get headlineLarge => textTheme.headlineLarge!;
  TextStyle get displaySmall => textTheme.displaySmall!;
  TextStyle get displayMedium => textTheme.displayMedium!;
  TextStyle get displayLarge => textTheme.displayLarge!;

  TextStyle get primary => TextStyle(color: Theme.of(this).colorScheme.primary);
}

extension CustomTextStyle on TextStyle {
  TextStyle get w100 => copyWith(fontWeight: FontWeight.w100);
  TextStyle get w200 => copyWith(fontWeight: FontWeight.w200);
  TextStyle get w300 => copyWith(fontWeight: FontWeight.w300);
  TextStyle get w400 => copyWith(fontWeight: FontWeight.w400);
  TextStyle get w500 => copyWith(fontWeight: FontWeight.w500);
  TextStyle get w600 => copyWith(fontWeight: FontWeight.w600);
  TextStyle get w700 => copyWith(fontWeight: FontWeight.w700);
  TextStyle get withBold => copyWith(fontWeight: FontWeight.bold);
  TextStyle get withItalic => copyWith(fontStyle: FontStyle.italic);
  TextStyle get withUnderline => copyWith(decoration: TextDecoration.underline);
  TextStyle withColor(Color color) => copyWith(color: color);
}
