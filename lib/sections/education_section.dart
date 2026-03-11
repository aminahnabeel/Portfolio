import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../widgets/section_title.dart';

// ── Education data ─────────────────────────────────────────────────────────────
const _education = [
  {
    'degree': 'BS Information Technology',
    'institute': 'Bahria University Islamabad',
    'years': '2022 – 2026',
    'grade': 'CGPA: 3.72 / 4.00',
  },
  {
    'degree': 'HSSC (Pre Medical)',
    'institute': 'Punjab College Islamabad',
    'years': '2018 – 2020',
    'grade': 'Marks: 1026 / 1100',
  },
  {
    'degree': 'Matriculation',
    'institute': 'OPF Girls College Islamabad',
    'years': '2016 – 2018',
    'grade': 'Marks: 1050 / 1100',
  },
];

/// Education section — centered title, content left, floating image right.
class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isDesktop = w >= 1024;
    final hPad = isDesktop ? 100.0 : 24.0;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 90),
      child: Column(
        children: [
          // Centered title & subtitle
          SectionTitle(
            title: 'Education',
            subtitle:
                'Academic milestones that built my foundation in technology '
                'and problem-solving.',
          ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2),
          const SizedBox(height: 64),

          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: isDesktop ? 1240 : 720),
            child: isDesktop ? _DesktopBody() : _MobileBody(),
          ),
        ],
      ),
    );
  }
}

// ── Desktop: cards left, floating image right ─────────────────────────────────
class _DesktopBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 58,
          child: Align(
            alignment: Alignment.centerLeft,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 620),
              child: Padding(
                padding: const EdgeInsets.only(left: 56, right: 36),
                child: _EduCards(),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 42,
          child: Transform.translate(
            offset: const Offset(0, 12),
            child: const Center(child: _FloatingEduImage()),
          ),
        ),
      ],
    );
  }
}

// ── Mobile: cards then image ──────────────────────────────────────────────────
class _MobileBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 680),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18, right: 6),
            child: _EduCards(),
          ),
          const SizedBox(height: 40),
          const _FloatingEduImage(),
        ],
      ),
    );
  }
}

// ── Floating image — no box, no border ────────────────────────────────────────
class _FloatingEduImage extends StatelessWidget {
  const _FloatingEduImage();

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isDesktop = w >= 1024;
    final imgSize = isDesktop ? 360.0 : 230.0;

    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: imgSize,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Soft ambient glow behind image
            Positioned.fill(
              child: IgnorePointer(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.purple.withValues(alpha: 0.14),
                        blurRadius: 96,
                        spreadRadius: 18,
                      ),
                      BoxShadow(
                        color: AppColors.orange.withValues(alpha: 0.09),
                        blurRadius: 64,
                        spreadRadius: 0,
                        offset: const Offset(22, 34),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 38,
              left: 52,
              right: 52,
              bottom: 28,
              child: IgnorePointer(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(999),
                    gradient: RadialGradient(
                      colors: [
                        AppColors.purple.withValues(alpha: 0.13),
                        AppColors.orange.withValues(alpha: 0.08),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // The image itself — floating freely
            Image.asset(
              'assets/edu.png',
              width: imgSize,
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) => Icon(
                Icons.school_rounded,
                size: imgSize * 0.35,
                color: Colors.white12,
              ),
            ),
          ],
        ),
      ),
    )
        .animate()
        .fadeIn(duration: 900.ms, delay: 300.ms)
        .slideY(begin: 0.08, curve: Curves.easeOut)
        .then()
        .shimmer(
          duration: 2000.ms,
          color: AppColors.purple.withValues(alpha: 0.06),
        );
  }
}

// ── Education cards list ──────────────────────────────────────────────────────
class _EduCards extends StatelessWidget {
  const _EduCards();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(_education.length, (i) {
        return _EduCard(data: _education[i], index: i);
      }),
    );
  }
}

// ── Individual education entry — timeline style, seamless ─────────────────────
class _EduCard extends StatefulWidget {
  final Map<String, String> data;
  final int index;
  const _EduCard({required this.data, required this.index});

  @override
  State<_EduCard> createState() => _EduCardState();
}

class _EduCardState extends State<_EduCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final isLast = widget.index == _education.length - 1;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOut,
        transform: Matrix4.translationValues(_hovered ? 6 : 0, 0, 0),
        transformAlignment: Alignment.centerLeft,
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Timeline spine ──────────────────────────────────────
              SizedBox(
                width: 22,
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    // Glowing dot
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: _hovered ? 12 : 10,
                      height: _hovered ? 12 : 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: AppColors.accentGradient,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.purple.withValues(alpha: _hovered ? 0.6 : 0.3),
                            blurRadius: _hovered ? 16 : 8,
                            spreadRadius: _hovered ? 2 : 0,
                          ),
                        ],
                      ),
                    ),
                    // Connector line
                    if (!isLast)
                      Expanded(
                        child: Container(
                          width: 1.5,
                          margin: const EdgeInsets.only(top: 10, bottom: 2),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                AppColors.purple.withValues(alpha: 0.35),
                                AppColors.purple.withValues(alpha: 0.05),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 18),

              // ── Content ─────────────────────────────────────────────
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(bottom: isLast ? 0 : 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Year badge + grade
                      Wrap(
                        spacing: 12,
                        runSpacing: 8,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              gradient: AppColors.horizontalGradient,
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.purple.withValues(alpha: 0.25),
                                  blurRadius: 12,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Text(
                              widget.data['years'] ?? '',
                              style: GoogleFonts.kanit(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                letterSpacing: 0.8,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ShaderMask(
                                shaderCallback: (b) =>
                                    AppColors.accentGradient.createShader(b),
                                child: const Icon(
                                  Icons.star_rounded,
                                  size: 14,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                widget.data['grade'] ?? '',
                                style: GoogleFonts.kanit(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Degree title
                      AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 300),
                        style: GoogleFonts.kanit(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: _hovered ? Colors.white : AppColors.textPrimary,
                          height: 1.2,
                        ),
                        child: Text(widget.data['degree'] ?? ''),
                      ),
                      const SizedBox(height: 10),

                      // Institute
                      Row(
                        children: [
                          ShaderMask(
                            shaderCallback: (b) =>
                                AppColors.accentGradient.createShader(b),
                            child: const Icon(
                              Icons.location_city_rounded,
                              size: 15,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              widget.data['institute'] ?? '',
                              style: GoogleFonts.kanit(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: AppColors.orange,
                                height: 1.4,
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (!isLast) ...[
                        const SizedBox(height: 24),
                        Container(
                          height: 1,
                          margin: const EdgeInsets.only(right: 24),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                AppColors.purple.withValues(alpha: 0.28),
                                AppColors.orange.withValues(alpha: 0.12),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      ],
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
        .fadeIn(
          delay: (widget.index * 200).ms,
          duration: 650.ms,
        )
        .slideX(begin: -0.08, curve: Curves.easeOut);
  }
}
