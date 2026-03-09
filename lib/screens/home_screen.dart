import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../constants/app_data.dart';
import '../sections/navbar_section.dart';
import '../sections/hero_section.dart';
import '../sections/about_section.dart';
import '../sections/services_section.dart';
import '../sections/projects_section.dart';
import '../sections/experience_section.dart';
import '../sections/testimonials_section.dart';
import '../sections/cta_section.dart';
import '../sections/footer_section.dart';

/// Root screen — sticky navbar overlay on top of a scrollable body with
/// decorative background glow circles. A slide-down mobile menu is included.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  bool _menuOpen = false;
  late final AnimationController _menuAnim;
  late final Animation<double> _menuFade;

  @override
  void initState() {
    super.initState();
    _menuAnim = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _menuFade = CurvedAnimation(parent: _menuAnim, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _menuAnim.dispose();
    super.dispose();
  }

  void _toggleMenu() {
    setState(() => _menuOpen = !_menuOpen);
    _menuOpen ? _menuAnim.forward() : _menuAnim.reverse();
  }

  void _closeMenu() {
    setState(() => _menuOpen = false);
    _menuAnim.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // ── 1. Decorative background glow circles ─────────────────────
          _BackgroundGlows(),

          // ── 2. Scrollable page content ────────────────────────────────
          SingleChildScrollView(
            child: Column(
              children: const [
                SizedBox(height: 80), // Space reserved for floating navbar
                HeroSection(),
                AboutSection(),
                ServicesSection(),
                ProjectsSection(),
                ExperienceSection(),
                TestimonialsSection(),
                CtaSection(),
                FooterSection(),
              ],
            ),
          ),

          // ── 3. Sticky navbar (always on top) ──────────────────────────
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: NavbarSection(onMenuTap: _toggleMenu),
          ),

          // ── 4. Mobile slide-down menu ─────────────────────────────────
          FadeTransition(
            opacity: _menuFade,
            child: _menuOpen ? _MobileMenu(onClose: _closeMenu) : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

// ── Decorative blurred gradient glow circles ──────────────────────────────────
class _BackgroundGlows extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        children: [
          // Purple glow — top right
          Positioned(
            top: -120,
            right: -120,
            child: _GlowCircle(
              color: AppColors.purple,
              size: 500,
              opacity: 0.18,
            ),
          ),
          // Orange glow — mid left
          Positioned(
            top: 700,
            left: -100,
            child: _GlowCircle(
              color: AppColors.orange,
              size: 400,
              opacity: 0.12,
            ),
          ),
          // Purple glow — lower right
          Positioned(
            top: 1500,
            right: -80,
            child: _GlowCircle(
              color: AppColors.purple,
              size: 380,
              opacity: 0.14,
            ),
          ),
          // Orange glow — bottom center
          Positioned(
            top: 2800,
            left: 0,
            right: 0,
            child: Center(
              child: _GlowCircle(
                color: AppColors.orange,
                size: 500,
                opacity: 0.1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GlowCircle extends StatelessWidget {
  final Color color;
  final double size;
  final double opacity;

  const _GlowCircle({
    required this.color,
    required this.size,
    required this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: 90, sigmaY: 90),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color.withValues(alpha: opacity),
        ),
      ),
    );
  }
}

// ── Full-screen mobile menu overlay ──────────────────────────────────────────
class _MobileMenu extends StatelessWidget {
  final VoidCallback onClose;

  const _MobileMenu({required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 80,
      left: 0,
      right: 0,
      bottom: 0,
      child: GestureDetector(
        onTap: onClose,
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              color: Colors.black.withValues(alpha: 0.92),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  ...AppData.navLinks.map(
                    (link) => _MobileNavItem(label: link, onTap: onClose),
                  ),
                  const SizedBox(height: 32),
                  _MobileDownloadCv(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MobileNavItem extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _MobileNavItem({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 40),
        child: Text(
          label,
          style: GoogleFonts.kanit(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
      ),
    );
  }
}

class _MobileDownloadCv extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Container(
        height: 54,
        decoration: BoxDecoration(
          gradient: AppColors.horizontalGradient,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(100),
            onTap: () {},
            child: Center(
              child: Text(
                'Download CV',
                style: GoogleFonts.kanit(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
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
