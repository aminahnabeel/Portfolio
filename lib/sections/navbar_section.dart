import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../constants/app_data.dart';
import '../widgets/gradient_button.dart';

/// Responsive sticky navigation bar.
/// On desktop shows full nav links; on mobile shows a hamburger that
/// triggers [onMenuTap].
class NavbarSection extends StatefulWidget {
  final VoidCallback? onMenuTap;
  final VoidCallback? onLogoTap;
  final ValueChanged<String>? onNavTap;
  final VoidCallback? onDownloadCvTap;

  const NavbarSection({
    super.key,
    this.onMenuTap,
    this.onLogoTap,
    this.onNavTap,
    this.onDownloadCvTap,
  });

  @override
  State<NavbarSection> createState() => _NavbarSectionState();
}

class _NavbarSectionState extends State<NavbarSection> {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isDesktop = w >= 1024;

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          height: 80,
          padding: EdgeInsets.symmetric(horizontal: isDesktop ? 60 : 24),
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.72),
            border: const Border(
              bottom: BorderSide(color: AppColors.glassBorder),
            ),
          ),
          child: Row(
            children: [
              // ── Logo ──────────────────────────────────────────────────────
              _buildLogo(),
              const Spacer(),
              // ── Desktop nav links ─────────────────────────────────────────
              if (isDesktop) ...[
                ...AppData.navLinks.map(
                  (link) => _NavLink(
                    label: link,
                    onTap: () => widget.onNavTap?.call(link),
                  ),
                ),
                const SizedBox(width: 28),
                GradientButton(
                  text: 'Download CV',
                  height: 44,
                  fontSize: 14,
                  onTap: widget.onDownloadCvTap ?? () {},
                ),
              ],
              // ── Mobile hamburger ──────────────────────────────────────────
              if (!isDesktop)
                IconButton(
                  icon: const Icon(
                    Icons.menu_rounded,
                    color: AppColors.textPrimary,
                    size: 28,
                  ),
                  onPressed: widget.onMenuTap,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return GestureDetector(
      onTap: widget.onLogoTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Profile circle
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.glassBorder, width: 1.5),
              ),
              child: ClipOval(
                child: Image.asset('assets/me.png', width: 30, height: 30),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              'Aminah Nabeel',
              style: GoogleFonts.kanit(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Individual nav link with hover tint ──────────────────────────────────────
class _NavLink extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const _NavLink({required this.label, required this.onTap});

  @override
  State<_NavLink> createState() => __NavLinkState();
}

class __NavLinkState extends State<_NavLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: GoogleFonts.kanit(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: _hovered ? AppColors.orange : AppColors.textSecondary,
            ),
            child: Text(widget.label),
          ),
        ),
      ),
    );
  }
}
