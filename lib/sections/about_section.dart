import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../widgets/section_title.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  static const String _bio =
      'I am a passionate IT graduate from Bahria University Islamabad, an app developer and AI enthusiast driven by curiosity and a deep interest in emerging technologies. I specialize in building modern, scalable applications using Flutter and enjoy transforming ideas into practical digital solutions. With a strong foundation in software development, databases, and machine learning concepts, I aim to design applications that are not only technically efficient but also intuitive and user-friendly. I constantly seek opportunities to learn new technologies, improve my skills, and stay updated with the evolving tech landscape. My goal is to leverage innovative technologies to solve real-world problems and create impactful digital experiences.';

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
              ? _DesktopLayout(bio: _bio)
              : _MobileLayout(bio: _bio),
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

  const _DesktopLayout({required this.bio});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Left – profile image
        Expanded(flex: 4, child: const _ProfileImage()),
        const SizedBox(width: 72),
        // Right – bio
        Expanded(flex: 5, child: _BioColumn(bio: bio)),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Mobile stacked layout
// ─────────────────────────────────────────────────────────────────────────────
class _MobileLayout extends StatelessWidget {
  final String bio;

  const _MobileLayout({required this.bio});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _ProfileImage(),
        const SizedBox(height: 44),
        _BioColumn(bio: bio),
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

  const _BioColumn({required this.bio});

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

      ],
    );
  }
}




