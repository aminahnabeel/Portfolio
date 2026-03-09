import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import 'glass_card.dart';

/// Testimonial card with stylised quote, review text, avatar and name.
class TestimonialCard extends StatelessWidget {
  final String name;
  final String role;
  final String initials;
  final String text;

  const TestimonialCard({
    super.key,
    required this.name,
    required this.role,
    required this.initials,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      width: 340,
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Large decorative quote mark
          ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (bounds) =>
                AppColors.horizontalGradient.createShader(bounds),
            child: Text(
              '\u201C',
              style: GoogleFonts.kanit(
                fontSize: 80,
                fontWeight: FontWeight.w700,
                height: 0.8,
              ),
            ),
          ),
          const SizedBox(height: 10),

          // Review text
          Text(
            text,
            style: GoogleFonts.kanit(
              fontSize: 15,
              color: AppColors.textSecondary,
              height: 1.75,
            ),
          ),
          const SizedBox(height: 26),

          // Avatar + name row
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  gradient: AppColors.accentGradient,
                  borderRadius: BorderRadius.circular(27),
                ),
                child: Center(
                  child: Text(
                    initials,
                    style: GoogleFonts.kanit(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.kanit(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    role,
                    style: GoogleFonts.kanit(
                      fontSize: 13,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
