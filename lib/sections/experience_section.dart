import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../constants/app_data.dart';
import '../widgets/section_title.dart';

/// Work experience presented as a modern vertical timeline — blends with bg.
class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isDesktop = w >= 1024;
    final hPad = isDesktop ? 80.0 : 24.0;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 80),
      child: Column(
        children: [
          SectionTitle(
            title: 'Experience',
            subtitle:
                'Real-world internships that shaped my skills and '
                'professional mindset.',
          ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2),
          const SizedBox(height: 64),

          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 820),
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
class _TimelineItem extends StatefulWidget {
  final Map<String, String> data;
  final bool isLast;
  final int index;

  const _TimelineItem({
    required this.data,
    required this.isLast,
    required this.index,
  });

  @override
  State<_TimelineItem> createState() => _TimelineItemState();
}

class _TimelineItemState extends State<_TimelineItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final number = (widget.index + 1).toString().padLeft(2, '0');

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Timeline spine ────────────────────────────────────────────
          SizedBox(
            width: 56,
            child: Column(
              children: [
                // Pulsing glow halo + inner gradient dot
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            AppColors.purple.withOpacity(0.35),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    )
                        .animate(onPlay: (c) => c.repeat(reverse: true))
                        .scaleXY(
                          begin: 0.7,
                          end: 1.3,
                          duration: 2200.ms,
                          curve: Curves.easeInOut,
                        )
                        .fade(begin: 0.3, end: 0.9, duration: 2200.ms),
                    Container(
                      width: 15,
                      height: 15,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: AppColors.accentGradient,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xBB9747FF),
                            blurRadius: 16,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // Gradient connector line fading to transparent
                if (!widget.isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [AppColors.purple, Color(0x009747FF)],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 20),

          // ── Card ─────────────────────────────────────────────────────
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: widget.isLast ? 0 : 44),
              child: MouseRegion(
                onEnter: (_) => setState(() => _hovered = true),
                onExit: (_) => setState(() => _hovered = false),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                  transform: Matrix4.translationValues(0, _hovered ? -4 : 0, 0),
                  transformAlignment: Alignment.center,
                  child: IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Left gradient accent bar
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: 3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            gradient: _hovered
                                ? AppColors.accentGradient
                                : LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      AppColors.purple.withOpacity(0.4),
                                      AppColors.orange.withOpacity(0.2),
                                    ],
                                  ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        // Card content
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Top row: number + duration badge
                                Row(
                                  children: [
                                    ShaderMask(
                                      shaderCallback: (b) =>
                                          AppColors.accentGradient
                                              .createShader(b),
                                      child: Text(
                                        number,
                                        style: GoogleFonts.kanit(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                          letterSpacing: 2,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 14, vertical: 5),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        gradient:
                                            AppColors.horizontalGradient,
                                      ),
                                      child: Text(
                                        widget.data['duration'] ?? '',
                                        style: GoogleFonts.kanit(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),

                                // Role
                                Text(
                                  widget.data['role'] ?? '',
                                  style: GoogleFonts.kanit(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: _hovered
                                        ? Colors.white
                                        : AppColors.textPrimary,
                                    height: 1.2,
                                  ),
                                ),
                                const SizedBox(height: 8),

                                // Company with icon
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.business_rounded,
                                      color: AppColors.orange,
                                      size: 14,
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      widget.data['company'] ?? '',
                                      style: GoogleFonts.kanit(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.orange,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),

                                // Gradient fade divider
                                Container(
                                  height: 1,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        AppColors.glassBorder,
                                        Colors.transparent,
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),

                                // Description
                                Text(
                                  widget.data['description'] ?? '',
                                  style: GoogleFonts.kanit(
                                    fontSize: 14,
                                    color: AppColors.textSecondary,
                                    height: 1.75,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
                  .animate()
                  .fadeIn(delay: (widget.index * 200).ms, duration: 600.ms)
                  .slideX(begin: 0.15, curve: Curves.easeOut),
            ),
          ),
        ],
      ),
    );
  }
}
