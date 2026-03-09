import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../widgets/section_title.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  static const String _bio =
      'I am a passionate IT graduate from Bahria University Islamabad, an app developer and AI enthusiast, driven by curiosity and a love for technology. I specialize in creating innovative software solutions, blending creativity with technical expertise. Always eager to learn and adapt, I strive to turn complex problems into elegant, user-friendly applications. My goal is to leverage cutting-edge technologies to make a meaningful impact in the digital world.';

  static const List<_TechItem> _techStack = [
    _TechItem('Flutter',   Icons.flutter_dash_rounded,        Color(0xFF54C5F8)),
    _TechItem('Dart',      Icons.code_rounded,                Color(0xFF0175C2)),
    _TechItem('Firebase',  Icons.local_fire_department_rounded,Color(0xFFFFB300)),
    _TechItem('Python',    Icons.terminal_rounded,            Color(0xFF4DB6AC)),
    _TechItem('AI / ML',   Icons.psychology_rounded,          Color(0xFF9747FF)),
    _TechItem('UI / UX',   Icons.palette_rounded,             Color(0xFFFE814C)),
    _TechItem('REST APIs', Icons.api_rounded,                 Color(0xFF66BB6A)),
    _TechItem('Docker',    Icons.storage_rounded,             Color(0xFF2496ED)),
  ];

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isDesktop = w >= 1024;

    return Container(
      padding: EdgeInsets.only(
        left: isDesktop ? 80 : 24,
        right: isDesktop ? 80 : 24,
        top: 48,
        bottom: 80,
      ),
      child: Column(
        children: [
          // ── Section header ──────────────────────────────────────────────
          SectionTitle(
            title: 'About Me',
            subtitle: 'A little more about who I am and what drives me.',
          )
              .animate()
              .fadeIn(duration: 600.ms)
              .slideY(begin: 0.2, curve: Curves.easeOut),

          const SizedBox(height: 44),

          // ── Body ────────────────────────────────────────────────────────
          isDesktop
              ? _DesktopLayout(bio: _bio, techStack: _techStack)
              : _MobileLayout(bio: _bio, techStack: _techStack),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Desktop two-column layout
// ─────────────────────────────────────────────────────────────────────────────
class _DesktopLayout extends StatelessWidget {
  final String bio;
  final List<_TechItem> techStack;

  const _DesktopLayout({required this.bio, required this.techStack});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Left – profile image
        Expanded(flex: 4, child: const _ProfileImage()),
        const SizedBox(width: 72),
        // Right – bio + tech stack
        Expanded(flex: 5, child: _BioColumn(bio: bio, techStack: techStack)),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Mobile stacked layout
// ─────────────────────────────────────────────────────────────────────────────
class _MobileLayout extends StatelessWidget {
  final String bio;
  final List<_TechItem> techStack;

  const _MobileLayout({required this.bio, required this.techStack});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _ProfileImage(),
        const SizedBox(height: 44),
        _BioColumn(bio: bio, techStack: techStack),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Left panel – profile photo with glow ring & floating badges
// ─────────────────────────────────────────────────────────────────────────────
class _ProfileImage extends StatelessWidget {
  const _ProfileImage();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Radial glow
          Container(
            width: 360,
            height: 360,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  AppColors.purple.withOpacity(0.30),
                  Colors.transparent,
                ],
              ),
            ),
          ),

          // Gradient-border frame + photo
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              gradient: AppColors.accentGradient,
              boxShadow: [
                BoxShadow(
                  color: AppColors.purple.withOpacity(0.45),
                  blurRadius: 48,
                  offset: const Offset(0, 20),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(28),
              child: Image.asset(
                'assets/1.png',
                width: 420,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(delay: 200.ms, duration: 800.ms)
        .scale(begin: const Offset(0.88, 0.88), curve: Curves.easeOut);
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Right column – bio paragraph + tech-stack row
// ─────────────────────────────────────────────────────────────────────────────
class _BioColumn extends StatelessWidget {
  final String bio;
  final List<_TechItem> techStack;

  const _BioColumn({required this.bio, required this.techStack});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 1024;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Gradient accent bar
        Container(
          width: 56,
          height: 4,
          decoration: BoxDecoration(
            gradient: AppColors.accentGradient,
            borderRadius: BorderRadius.circular(2),
          ),
        )
            .animate()
            .fadeIn(delay: 200.ms, duration: 500.ms)
            .slideX(begin: -0.4, curve: Curves.easeOut),

        const SizedBox(height: 28),

        // Bio paragraph
        Text(
          bio,
          style: GoogleFonts.kanit(
            fontSize: isDesktop ? 16 : 15,
            fontWeight: FontWeight.w400,
            color: AppColors.textSecondary,
            height: 1.85,
          ),
        )
            .animate()
            .fadeIn(delay: 300.ms, duration: 700.ms)
            .slideY(begin: 0.2, curve: Curves.easeOut),

        const SizedBox(height: 40),

        // ── Tech Stack label ─────────────────────────────────────────────
        Row(
          children: [
            Text(
              'TECH STACK',
              style: GoogleFonts.kanit(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: AppColors.orange,
                letterSpacing: 3,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Container(
                height: 1,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.orange.withOpacity(0.5),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ).animate().fadeIn(delay: 450.ms, duration: 500.ms),

        const SizedBox(height: 18),

        // ── Tech chips (horizontal, wraps on mobile) ─────────────────────
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: techStack.asMap().entries.map((entry) {
            return _TechChip(item: entry.value, index: entry.key);
          }).toList(),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Individual tech chip with per-item accent color
// ─────────────────────────────────────────────────────────────────────────────
class _TechChip extends StatelessWidget {
  final _TechItem item;
  final int index;

  const _TechChip({required this.item, required this.index});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: item.color.withOpacity(0.08),
            border: Border.all(
              color: item.color.withOpacity(0.40),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Colored dot indicator
              Container(
                width: 7,
                height: 7,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: item.color,
                  boxShadow: [
                    BoxShadow(
                      color: item.color.withOpacity(0.6),
                      blurRadius: 6,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Icon(item.icon, size: 14, color: item.color),
              const SizedBox(width: 6),
              Text(
                item.label,
                style: GoogleFonts.kanit(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    )
        .animate()
        .fadeIn(
          delay: Duration(milliseconds: 530 + index * 70),
          duration: 400.ms,
        )
        .scale(begin: const Offset(0.78, 0.78), curve: Curves.easeOut);
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Data model
// ─────────────────────────────────────────────────────────────────────────────
class _TechItem {
  final String label;
  final IconData icon;
  final Color color;
  const _TechItem(this.label, this.icon, this.color);
}


