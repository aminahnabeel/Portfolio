import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../constants/app_colors.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 1024;
    final horizontalPadding = isDesktop ? 80.0 : 24.0;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        horizontalPadding,
        14,
        horizontalPadding,
        40,
      ),
      child: Column(
        children: [
          Container(
            height: 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white.withValues(alpha: 0.0),
                  AppColors.purple.withValues(alpha: 0.8),
                  AppColors.orange.withValues(alpha: 0.8),
                  Colors.white.withValues(alpha: 0.0),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1160),
            child: Column(
              children: [
                LayoutBuilder(
                  builder: (context, constraints) {
                    final useRow = constraints.maxWidth >= 900;

                    final leftPanel = SizedBox(
                      width: useRow ? 300 : 240,
                      height: useRow ? 300 : 240,
                      child: Center(
                        child: Lottie.asset(
                          'assets/contact.json',
                          width: useRow ? 250 : 200,
                          height: useRow ? 250 : 200,
                          fit: BoxFit.contain,
                          repeat: true,
                          animate: true,
                        ),
                      ),
                    );

                    final rightPanel = Expanded(
                      child: Column(
                        crossAxisAlignment: useRow
                            ? CrossAxisAlignment.start
                            : CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Thank You for Viewing My Portfolio',
                            textAlign: useRow
                                ? TextAlign.left
                                : TextAlign.center,
                            style: GoogleFonts.kanit(
                              fontSize: useRow ? 34 : 28,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              height: 1.08,
                              letterSpacing: -0.4,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'I truly appreciate your time and support. I am excited to keep learning, collaborating, and building products that create real impact.',
                            textAlign: useRow
                                ? TextAlign.left
                                : TextAlign.center,
                            style: GoogleFonts.kanit(
                              fontSize: 15,
                              color: AppColors.textSecondary,
                              height: 1.6,
                            ),
                          ),
                        ],
                      ),
                    );

                    if (useRow) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          leftPanel,
                          const SizedBox(width: 30),
                          rightPanel,
                        ],
                      );
                    }

                    return Column(
                      children: [
                        Center(child: leftPanel),
                        const SizedBox(height: 16),
                        rightPanel,
                      ],
                    );
                  },
                ),
                const SizedBox(height: 16),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final isWideEnough = constraints.maxWidth >= 1000;

                    const points = [
                      _InlinePoint(
                        icon: Icons.work_outline_rounded,
                        text:
                            'Available for internships and collaborative projects',
                        color: Color(0xFFFF8B62),
                      ),
                      _InlinePoint(
                        icon: Icons.phone_android_rounded,
                        text:
                            'Project focus: mobile app development and modern UI',
                        color: Color(0xFF8F7BFF),
                      ),
                      _InlinePoint(
                        icon: Icons.auto_awesome_rounded,
                        text:
                            'Passionate about learning and building impactful solutions',
                        color: Color(0xFF4FD6C3),
                      ),
                      _InlinePoint(
                        icon: Icons.schedule_rounded,
                        text: 'Response window: within 24 hours',
                        color: Color(0xFFFFB84D),
                      ),
                    ];

                    if (isWideEnough) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var i = 0; i < points.length; i++) ...[
                            Expanded(child: points[i]),
                            if (i != points.length - 1)
                              const SizedBox(width: 36),
                          ],
                        ],
                      );
                    }

                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (var i = 0; i < points.length; i++) ...[
                            SizedBox(width: 250, child: points[i]),
                            if (i != points.length - 1)
                              const SizedBox(width: 26),
                          ],
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 18),
                Container(
                  height: 1,
                  color: Colors.white.withValues(alpha: 0.08),
                ),
                const SizedBox(height: 12),
                Text(
                  '© 2026 Aminah Nabeel  ·  All Rights Reserved',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.kanit(
                    fontSize: 13,
                    color: AppColors.textSecondary.withValues(alpha: 0.7),
                    letterSpacing: 0.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InlinePoint extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;

  const _InlinePoint({
    required this.icon,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: color, size: 18),
            const SizedBox(width: 8),
            Expanded(
              child: Container(height: 2, color: color.withValues(alpha: 0.55)),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          text,
          style: GoogleFonts.kanit(
            fontSize: 13.5,
            color: Colors.white.withValues(alpha: 0.92),
            height: 1.4,
          ),
        ),
      ],
    );
  }
}
