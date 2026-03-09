import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../widgets/glass_card.dart';
import '../widgets/gradient_button.dart';

/// Full-width call-to-action section inside a glass card.
class CtaSection extends StatelessWidget {
  const CtaSection({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isDesktop = w >= 1024;
    final hPad = isDesktop ? 80.0 : 24.0;

    return Container(
      color: const Color(0xFF050505),
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 80),
      child: GlassCard(
        padding: EdgeInsets.symmetric(
          vertical: 60,
          horizontal: isDesktop ? 80 : 32,
        ),
        child: Column(
          children: [
            // Spark icon
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                gradient: AppColors.accentGradient,
                borderRadius: BorderRadius.circular(27),
              ),
              child: const Icon(
                Icons.bolt_rounded,
                color: Colors.white,
                size: 36,
              ),
            )
                .animate()
                .fadeIn(duration: 500.ms)
                .scale(begin: const Offset(0.7, 0.7)),
            const SizedBox(height: 28),

            // Heading
            ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (b) =>
                  AppColors.horizontalGradient.createShader(b),
              child: Text(
                "Let's Build Something\nTogether",
                textAlign: TextAlign.center,
                style: GoogleFonts.kanit(
                  fontSize: isDesktop ? 48 : 34,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  height: 1.2,
                ),
              ),
            )
                .animate()
                .fadeIn(delay: 150.ms, duration: 600.ms)
                .slideY(begin: 0.2),
            const SizedBox(height: 18),

            Text(
              'Have a project in mind? Let\'s collaborate and turn your ideas\n'
              'into a polished, high-impact digital product.',
              textAlign: TextAlign.center,
              style: GoogleFonts.kanit(
                fontSize: 16,
                color: AppColors.textSecondary,
                height: 1.7,
              ),
            )
                .animate()
                .fadeIn(delay: 300.ms, duration: 600.ms),
            const SizedBox(height: 40),

            GradientButton(
              text: 'Get In Touch',
              height: 56,
              width: 200,
              fontSize: 17,
              onTap: () {},
            )
                .animate()
                .fadeIn(delay: 450.ms, duration: 600.ms)
                .slideY(begin: 0.2),
          ],
        ),
      ),
    );
  }
}
