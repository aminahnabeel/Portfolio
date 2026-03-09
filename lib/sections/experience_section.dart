import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../constants/app_data.dart';
import '../widgets/section_title.dart';
import '../widgets/glass_card.dart';

/// Work experience presented as a vertical timeline.
class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isDesktop = w >= 1024;
    final hPad = isDesktop ? 80.0 : 24.0;

    return Container(
      color: const Color(0xFF050505),
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 80),
      child: Column(
        children: [
          SectionTitle(
            title: 'Experience',
            subtitle:
                'Real-world internships that shaped my skills and professional mindset.',
          ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2),
          const SizedBox(height: 60),

          // Timeline
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 780),
            child: Column(
              children: List.generate(AppData.experience.length, (i) {
                return _TimelineItem(
                  data: AppData.experience[i],
                  isLast: i == AppData.experience.length - 1,
                  index: i,
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Single timeline row ───────────────────────────────────────────────────────
class _TimelineItem extends StatelessWidget {
  final Map<String, String> data;
  final bool isLast;
  final int index;

  const _TimelineItem({
    required this.data,
    required this.isLast,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Timeline spine ─────────────────────────────────────────────
          SizedBox(
            width: 48,
            child: Column(
              children: [
                // Dot
                Container(
                  width: 18,
                  height: 18,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: AppColors.accentGradient,
                  ),
                ),
                // Vertical line
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      color: AppColors.glassBorder,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 16),

          // ── Card ───────────────────────────────────────────────────────
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 32),
              child: GlassCard(
                padding: const EdgeInsets.all(28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Duration badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        gradient: AppColors.horizontalGradient,
                      ),
                      child: Text(
                        data['duration'] ?? '',
                        style: GoogleFonts.kanit(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),

                    // Role
                    Text(
                      data['role'] ?? '',
                      style: GoogleFonts.kanit(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),

                    // Company
                    Text(
                      data['company'] ?? '',
                      style: GoogleFonts.kanit(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: AppColors.orange,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Description
                    Text(
                      data['description'] ?? '',
                      style: GoogleFonts.kanit(
                        fontSize: 14,
                        color: AppColors.textSecondary,
                        height: 1.7,
                      ),
                    ),
                  ],
                ),
              )
                  .animate()
                  .fadeIn(delay: (index * 200).ms, duration: 600.ms)
                  .slideX(begin: 0.15, curve: Curves.easeOut),
            ),
          ),
        ],
      ),
    );
  }
}
