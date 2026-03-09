import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../constants/app_colors.dart';
import '../constants/app_data.dart';
import '../widgets/section_title.dart';
import '../widgets/testimonial_card.dart';

/// Horizontally scrollable testimonial carousel with prev/next arrow controls.
class TestimonialsSection extends StatefulWidget {
  const TestimonialsSection({super.key});

  @override
  State<TestimonialsSection> createState() => _TestimonialsSectionState();
}

class _TestimonialsSectionState extends State<TestimonialsSection> {
  final _scrollController = ScrollController();
  static const double _cardWidth  = 340;
  static const double _cardGap    = 24;
  static const double _scrollStep = _cardWidth + _cardGap;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollLeft() {
    _scrollController.animateTo(
      (_scrollController.offset - _scrollStep).clamp(
          0, _scrollController.position.maxScrollExtent),
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void _scrollRight() {
    _scrollController.animateTo(
      (_scrollController.offset + _scrollStep).clamp(
          0, _scrollController.position.maxScrollExtent),
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isDesktop = w >= 1024;
    final hPad = isDesktop ? 80.0 : 24.0;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 80),
      child: Column(
        children: [
          SectionTitle(
            title: 'Testimonials',
            subtitle: 'What clients and collaborators have to say.',
          ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2),
          const SizedBox(height: 56),

          // Carousel + arrow buttons
          Row(
            children: [
              // Left arrow
              _ArrowButton(icon: Icons.arrow_back_ios_new_rounded, onTap: _scrollLeft),
              const SizedBox(width: 16),

              // Scrollable card list
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      AppData.testimonials.length,
                      (i) {
                        final t = AppData.testimonials[i];
                        return Padding(
                          padding: EdgeInsets.only(
                            right: i < AppData.testimonials.length - 1
                                ? _cardGap
                                : 0,
                          ),
                          child: TestimonialCard(
                            name:     t['name']!,
                            role:     t['role']!,
                            initials: t['initials']!,
                            text:     t['text']!,
                          )
                              .animate()
                              .fadeIn(delay: (i * 150).ms, duration: 600.ms),
                        );
                      },
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 16),
              // Right arrow
              _ArrowButton(icon: Icons.arrow_forward_ios_rounded, onTap: _scrollRight),
            ],
          ),

          // Indicator dots
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              AppData.testimonials.length,
              (i) => _Dot(active: i == 0),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Circular arrow button ─────────────────────────────────────────────────────
class _ArrowButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _ArrowButton({required this.icon, required this.onTap});

  @override
  State<_ArrowButton> createState() => __ArrowButtonState();
}

class __ArrowButtonState extends State<_ArrowButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit:  (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: _hovered ? AppColors.accentGradient : null,
            border: _hovered
                ? null
                : Border.all(color: AppColors.glassBorder),
            color: _hovered ? null : AppColors.glassBg,
          ),
          child: Icon(
            widget.icon,
            color: Colors.white,
            size: 18,
          ),
        ),
      ),
    );
  }
}

// ── Small indicator dot ───────────────────────────────────────────────────────
class _Dot extends StatelessWidget {
  final bool active;
  const _Dot({required this.active});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width:  active ? 24 : 8,
      height: 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        gradient: active ? AppColors.horizontalGradient : null,
        color: active ? null : AppColors.glassBorder,
      ),
    );
  }
}
