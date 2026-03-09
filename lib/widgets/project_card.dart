import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../models/project_model.dart';
import 'glass_card.dart';

/// Project card with gradient thumbnail, title, description, tech tags
/// and a "View Details" button. Lifts on hover for web.
class ProjectCard extends StatefulWidget {
  final ProjectModel project;

  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
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
          padding: EdgeInsets.zero,
          borderRadius: 40,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Thumbnail ────────────────────────────────────────────────
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft:  Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                child: Container(
                  height: 190,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: widget.project.gradientColors,
                      begin: Alignment.topLeft,
                      end:   Alignment.bottomRight,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      widget.project.title.substring(0, 2).toUpperCase(),
                      style: GoogleFonts.kanit(
                        fontSize: 72,
                        fontWeight: FontWeight.w800,
                        color: Colors.white.withValues(alpha: 0.25),
                      ),
                    ),
                  ),
                ),
              ),

              // ── Content ──────────────────────────────────────────────────
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.project.title,
                      style: GoogleFonts.kanit(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.project.description,
                      style: GoogleFonts.kanit(
                        fontSize: 14,
                        color: AppColors.textSecondary,
                        height: 1.65,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Tech tags
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: widget.project.tags.map((tag) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: AppColors.purple.withValues(alpha: 0.5),
                            ),
                            color: AppColors.purple.withValues(alpha: 0.1),
                          ),
                          child: Text(
                            tag,
                            style: GoogleFonts.kanit(
                              fontSize: 12,
                              color: AppColors.purple,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 20),

                    // View Details button
                    Container(
                      height: 46,
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
                              'View Details',
                              style: GoogleFonts.kanit(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
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
