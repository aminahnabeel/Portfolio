import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../constants/app_colors.dart';

/// Hero landing section — wide layout on desktop, stacked on mobile.
class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isDesktop = w >= 1024;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : 24,
        vertical: 80,
      ),
      child: isDesktop
          ? _DesktopHero()
          : _MobileHero(),
    );
  }
}

// ── Desktop (side-by-side) ───────────────────────────────────────────────────
class _DesktopHero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Left — text content
        Expanded(flex: 5, child: _TextContent()),
        const SizedBox(width: 60),
        // Right — profile photo
        Expanded(flex: 3, child: _ProfileImage()),
      ],
    );
  }
}

// ── Mobile (stacked) ─────────────────────────────────────────────────────────
class _MobileHero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ProfileImage(),
        const SizedBox(height: 40),
        _TextContent(),
      ],
    );
  }
}

// ── Shared text block ────────────────────────────────────────────────────────
class _TextContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isDesktop = w >= 1024;

    return Column(
      crossAxisAlignment: isDesktop
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        // Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: AppColors.glassBorder, width: 1.5),
            color: AppColors.glassBg,
          ),
          child: Text(
            'HELLO FOLKS!',
            style: GoogleFonts.kanit(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.orange,
              letterSpacing: 2.5,
            ),
          ),
        )
            .animate()
            .fadeIn(duration: 600.ms)
            .slideY(begin: 0.3, curve: Curves.easeOut),
        const SizedBox(height: 24),

        // Headline with orange highlight on name
        RichText(
          textAlign: isDesktop ? TextAlign.left : TextAlign.center,
          text: TextSpan(
            style: GoogleFonts.kanit(
              fontSize: isDesktop ? 54 : 36,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
              height: 1.2,
            ),
            children: const [
              TextSpan(text: "I'm "),
              TextSpan(
                text: 'Aminah Nabeel !',
                style: TextStyle(color: AppColors.orange),
              ),
              TextSpan(
                  text: "\nLet's build something\nmeaningful together."),
            ],
          ),
        )
            .animate()
            .fadeIn(delay: 200.ms, duration: 700.ms)
            .slideY(begin: 0.25, curve: Curves.easeOut),
        const SizedBox(height: 20),

        // Subtitle
        Text(
          'Flutter Developer  |  AI Enthusiast',
          textAlign: isDesktop ? TextAlign.left : TextAlign.center,
          style: GoogleFonts.kanit(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: AppColors.textSecondary,
            letterSpacing: 0.5,
          ),
        )
            .animate()
            .fadeIn(delay: 400.ms, duration: 600.ms),
        const SizedBox(height: 40),
      ],
    );
  }
}

// ── Profile image ─────────────────────────────────────────────────────────────
class _ProfileImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Lottie.asset(
        'assets/dev.json',
        height: 380,
        width: 380,
        fit: BoxFit.contain,
      ),
    )
        .animate()
        .fadeIn(delay: 300.ms, duration: 800.ms)
        .scale(
          begin: const Offset(0.85, 0.85),
          curve: Curves.easeOut,
        );
  }
}

// end of file
