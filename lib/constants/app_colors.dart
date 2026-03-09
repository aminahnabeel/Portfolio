import 'package:flutter/material.dart';

/// Central color palette and gradient definitions for the portfolio.
class AppColors {
  AppColors._();

  // — Core backgrounds —
  static const Color background = Color(0xFF000000);
  static const Color footerBg   = Color(0xFF0D0D0D);

  // — Accent colors —
  static const Color purple = Color(0xFF9747FF);
  static const Color orange = Color(0xFFFE814C);

  // — Text —
  static const Color textPrimary   = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFAAAAAA);

  // — Glass / card —
  static const Color glassBg     = Color(0x14FFFFFF); // ~8 % white
  static const Color glassBorder = Color(0x26FFFFFF); // ~15 % white

  // — Gradients —
  static const LinearGradient accentGradient = LinearGradient(
    colors: [purple, orange],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient horizontalGradient = LinearGradient(
    colors: [purple, orange],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
