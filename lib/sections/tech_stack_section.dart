import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../widgets/section_title.dart';

/// Standalone full-width Tech Stack section.
/// Displays pill-style technology badges with glow, icon, and accent color.
class TechStackSection extends StatelessWidget {
  const TechStackSection({super.key});

  static const List<_TechItem> _techStack = [
    _TechItem('Flutter',   Icons.flutter_dash_rounded,         Color(0xFF54C5F8)),
    _TechItem('Dart',      Icons.code_rounded,                 Color(0xFF0175C2)),
    _TechItem('Firebase',  Icons.local_fire_department_rounded, Color(0xFFFFB300)),
    _TechItem('Python',    Icons.terminal_rounded,             Color(0xFF4DB6AC)),
    _TechItem('AI / ML',   Icons.psychology_rounded,           Color(0xFF9747FF)),
    _TechItem('UI / UX',   Icons.palette_rounded,              Color(0xFFFE814C)),
    _TechItem('REST APIs', Icons.api_rounded,                  Color(0xFF66BB6A)),
    _TechItem('Docker',    Icons.storage_rounded,              Color(0xFF2496ED)),
  ];

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isDesktop = w >= 1024;
    final hPad = isDesktop ? 80.0 : 24.0;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 80),
      child: Column(
        children: [
          // ── Section heading ──────────────────────────────────────────────
          SectionTitle(
            title: 'Tech Stack',
            subtitle:
                'The technologies and tools I use to build modern, '
                'production-grade applications.',
          )
              .animate()
              .fadeIn(duration: 600.ms)
              .slideY(begin: 0.2, curve: Curves.easeOut),

          const SizedBox(height: 68),

          // ── Badge grid ──────────────────────────────────────────────────
          Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: isDesktop ? 900 : double.infinity),
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 23,
                runSpacing: 23,
                children: _techStack.asMap().entries.map((entry) {
                  return _TechBadge(item: entry.value, index: entry.key);
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Individual badge pill – with hover glow
// ─────────────────────────────────────────────────────────────────────────────
class _TechBadge extends StatefulWidget {
  final _TechItem item;
  final int index;

  const _TechBadge({required this.item, required this.index});

  @override
  State<_TechBadge> createState() => _TechBadgeState();
}

class _TechBadgeState extends State<_TechBadge> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final c = widget.item.color;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit:  (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedScale(
        scale: _hovered ? 1.08 : 1.0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: c.withOpacity(_hovered ? 0.45 : 0.20),
                blurRadius: _hovered ? 28 : 14,
                spreadRadius: _hovered ? 3 : 1,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 13),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  // Subtle gradient fill that brightens on hover
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      c.withOpacity(_hovered ? 0.18 : 0.10),
                      c.withOpacity(_hovered ? 0.08 : 0.04),
                    ],
                  ),
                  border: Border.all(
                    color: c.withOpacity(_hovered ? 0.70 : 0.38),
                    width: 1.2,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Glowing dot
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: c,
                        boxShadow: [
                          BoxShadow(
                            color: c.withOpacity(0.75),
                            blurRadius: 10,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Icon(widget.item.icon, size: 17, color: c),
                    const SizedBox(width: 9),
                    Text(
                      widget.item.label,
                      style: GoogleFonts.kanit(
                        fontSize: 14.5,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    )
        .animate()
        .fadeIn(
          delay: Duration(milliseconds: 300 + widget.index * 80),
          duration: 500.ms,
        )
        .scale(begin: const Offset(0.80, 0.80), curve: Curves.easeOut);
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
