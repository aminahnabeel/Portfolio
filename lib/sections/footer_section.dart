import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/app_colors.dart';
import '../constants/app_data.dart';

/// Site footer with logo, tagline, social icons and copyright.
class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isDesktop = w >= 1024;

    return Container(
      color: AppColors.footerBg,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : 24,
        vertical: 60,
      ),
      child: Column(
        children: [
          // Divider line
          Container(
            height: 1,
            decoration: const BoxDecoration(
              gradient: AppColors.horizontalGradient,
            ),
          ),
          const SizedBox(height: 48),

          // Logo
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              gradient: AppColors.accentGradient,
              borderRadius: BorderRadius.circular(27),
            ),
            child: Center(
              child: Text(
                'AN',
                style: GoogleFonts.kanit(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Tagline
          Text(
            'Wanna see more behind the scenes?\nCheck out my socials below!',
            textAlign: TextAlign.center,
            style: GoogleFonts.kanit(
              fontSize: 15,
              color: AppColors.textSecondary,
              height: 1.7,
            ),
          ),
          const SizedBox(height: 32),

          // Social icons row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _SocialIcon(
                label: 'in',
                tooltip: 'LinkedIn',
                url: AppData.linkedInUrl,
              ),
              const SizedBox(width: 16),
              _SocialIcon(
                label: 'GH',
                tooltip: 'GitHub',
                url: AppData.githubUrl,
                icon: Icons.code_rounded,
              ),
              const SizedBox(width: 16),
              _SocialIcon(
                label: 'IG',
                tooltip: 'Instagram',
                url: AppData.instagramUrl,
                icon: Icons.camera_alt_rounded,
              ),
              const SizedBox(width: 16),
              _SocialIcon(
                label: 'Be',
                tooltip: 'Behance',
                url: AppData.behanceUrl,
              ),
            ],
          ),
          const SizedBox(height: 40),

          // Divider
          Container(
            height: 1,
            color: AppColors.glassBorder,
          ),
          const SizedBox(height: 24),

          // Copyright
          Text(
            '© 2026 Aminah Nabeel  ·  All Rights Reserved',
            style: GoogleFonts.kanit(
              fontSize: 13,
              color: AppColors.textSecondary.withValues(alpha: 0.7),
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Individual social icon button ─────────────────────────────────────────────
class _SocialIcon extends StatefulWidget {
  final String label;
  final String tooltip;
  final String url;
  final IconData? icon;

  const _SocialIcon({
    required this.label,
    required this.tooltip,
    required this.url,
    this.icon,
  });

  @override
  State<_SocialIcon> createState() => __SocialIconState();
}

class __SocialIconState extends State<_SocialIcon> {
  bool _hovered = false;

  Future<void> _launch() async {
    final uri = Uri.parse(widget.url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.tooltip,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _hovered = true),
        onExit:  (_) => setState(() => _hovered = false),
        child: GestureDetector(
          onTap: _launch,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(27),
              gradient: _hovered ? AppColors.accentGradient : null,
              border: _hovered
                  ? null
                  : Border.all(color: AppColors.glassBorder),
              color: _hovered ? null : AppColors.glassBg,
            ),
            child: Center(
              child: widget.icon != null
                  ? Icon(widget.icon, color: Colors.white, size: 20)
                  : Text(
                      widget.label,
                      style: GoogleFonts.kanit(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
