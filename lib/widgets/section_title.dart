import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

/// Section heading with gradient shimmer title and optional subtitle.
class SectionTitle extends StatelessWidget {
  final String title;
  final String? subtitle;
  final TextAlign textAlign;

  const SectionTitle({
    super.key,
    required this.title,
    this.subtitle,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    final crossAxis = textAlign == TextAlign.left
        ? CrossAxisAlignment.start
        : CrossAxisAlignment.center;

    return Column(
      crossAxisAlignment: crossAxis,
      children: [
        ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) =>
              AppColors.horizontalGradient.createShader(bounds),
          child: Text(
            title,
            textAlign: textAlign,
            style: GoogleFonts.kanit(
              fontSize: 52,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 14),
          Text(
            subtitle!,
            textAlign: textAlign,
            style: GoogleFonts.kanit(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: AppColors.textSecondary,
              height: 1.7,
            ),
          ),
        ],
      ],
    );
  }
}
