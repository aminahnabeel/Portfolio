import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../models/service_model.dart';
import 'glass_card.dart';

/// Service card with gradient preview area, title, description and arrow button.
class ServiceCard extends StatefulWidget {
  final ServiceModel service;

  const ServiceCard({super.key, required this.service});

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit:  (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 280),
        transform: _hovered
            ? Matrix4.translationValues(0, -8, 0)
            : Matrix4.identity(),
        child: GlassCard(
          borderRadius: 40,
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Gradient preview image ──────────────────────────────────
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft:  Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                child: Container(
                  height: 180,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: widget.service.gradientColors,
                      begin: Alignment.topLeft,
                      end:   Alignment.bottomRight,
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      widget.service.icon,
                      size: 70,
                      color: Colors.white.withValues(alpha: 0.85),
                    ),
                  ),
                ),
              ),

              // ── Content ─────────────────────────────────────────────────
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.service.title,
                      style: GoogleFonts.kanit(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.service.description,
                      style: GoogleFonts.kanit(
                        fontSize: 14,
                        color: AppColors.textSecondary,
                        height: 1.65,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Arrow icon button
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          gradient: AppColors.accentGradient,
                          borderRadius: BorderRadius.circular(27),
                        ),
                        child: const Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
