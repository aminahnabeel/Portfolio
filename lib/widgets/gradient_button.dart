import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

/// Primary gradient CTA button with scale hover effect.
class GradientButton extends StatefulWidget {
  final String text;
  final VoidCallback? onTap;
  final double? width;
  final double height;
  final double fontSize;

  const GradientButton({
    super.key,
    required this.text,
    this.onTap,
    this.width,
    this.height = 52,
    this.fontSize = 16,
  });

  @override
  State<GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit:  (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: widget.width,
          height: widget.height,
          transform: _hovered
              ? Matrix4.diagonal3Values(1.04, 1.04, 1.0)
              : Matrix4.identity(),
          transformAlignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: AppColors.horizontalGradient,
            borderRadius: BorderRadius.circular(100),
            boxShadow: _hovered
                ? [
                    BoxShadow(
                      color: AppColors.purple.withValues(alpha: 0.45),
                      blurRadius: 24,
                      spreadRadius: 2,
                    ),
                  ]
                : [],
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Text(
                widget.text,
                style: GoogleFonts.kanit(
                  color: Colors.white,
                  fontSize: widget.fontSize,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
