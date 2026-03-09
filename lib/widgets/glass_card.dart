import 'dart:ui';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

/// Reusable glassmorphism card with blur, semi-transparent background,
/// white border, and rounded corners.
class GlassCard extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final bool showBorder;

  const GlassCard({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.borderRadius = 40,
    this.padding,
    this.showBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
        child: Container(
          width: width,
          height: height,
          padding: padding ?? const EdgeInsets.all(28),
          decoration: BoxDecoration(
            color: AppColors.glassBg,
            borderRadius: BorderRadius.circular(borderRadius),
            border: showBorder
                ? Border.all(color: AppColors.glassBorder, width: 1.5)
                : null,
          ),
          child: child,
        ),
      ),
    );
  }
}
