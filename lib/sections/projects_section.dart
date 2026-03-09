import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../constants/app_data.dart';
import '../widgets/section_title.dart';
import '../widgets/project_card.dart';

/// Projects section — 2-column grid (desktop) or single-column (mobile).
class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final w  = MediaQuery.of(context).size.width;
    final isDesktop = w >= 1024;
    final hPad = isDesktop ? 80.0 : 24.0;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 80),
      child: Column(
        children: [
          SectionTitle(
            title: 'My Works',
            subtitle:
                'A selection of projects that reflect my passion for clean '
                'code, intuitive design, and impactful technology.',
          ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2),
          const SizedBox(height: 56),

          isDesktop ? _buildGrid() : _buildColumn(),
        ],
      ),
    );
  }

  // ── Desktop: 2-column grid ────────────────────────────────────────────────
  Widget _buildGrid() {
    final projects = AppData.projects;
    final rows = (projects.length / 2).ceil();

    return Column(
      children: List.generate(rows, (row) {
        final a = row * 2;
        final b = a + 1;
        return Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ProjectCard(project: projects[a])
                    .animate()
                    .fadeIn(delay: (a * 120).ms, duration: 600.ms)
                    .slideY(begin: 0.2, curve: Curves.easeOut),
              ),
              if (b < projects.length) ...[
                const SizedBox(width: 24),
                Expanded(
                  child: ProjectCard(project: projects[b])
                      .animate()
                      .fadeIn(delay: (b * 120).ms, duration: 600.ms)
                      .slideY(begin: 0.2, curve: Curves.easeOut),
                ),
              ] else
                const Expanded(child: SizedBox()),
            ],
          ),
        );
      }),
    );
  }

  // ── Mobile: vertical list ─────────────────────────────────────────────────
  Widget _buildColumn() {
    return Column(
      children: List.generate(AppData.projects.length, (i) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: ProjectCard(project: AppData.projects[i])
              .animate()
              .fadeIn(delay: (i * 120).ms, duration: 600.ms),
        );
      }),
    );
  }
}
