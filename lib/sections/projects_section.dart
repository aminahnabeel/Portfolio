import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../constants/app_data.dart';
import '../widgets/section_title.dart';
import '../widgets/project_card.dart';

/// Featured Projects section — 4-col (desktop) / 2-col (tablet) / 1-col (mobile).
class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isDesktop = w >= 1024;
    final isTablet  = w >= 600 && w < 1024;
    final hPad = isDesktop ? 80.0 : 24.0;
    final cols = isDesktop ? 4 : (isTablet ? 2 : 1);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 80),
      child: Column(
        children: [
          SectionTitle(
            title: 'Featured Projects',
            subtitle:
                'A selection of projects that reflect my passion for clean '
                'code, intuitive design, and impactful technology.',
          ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2),
          const SizedBox(height: 56),

          _buildGrid(AppData.projects, cols),
        ],
      ),
    );
  }

  Widget _buildGrid(List projects, int cols) {
    final rows = (projects.length / cols).ceil();
    return Column(
      children: List.generate(rows, (row) {
        final start = row * cols;
        final end = (start + cols).clamp(0, projects.length);
        final rowItems = projects.sublist(start, end);

        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int i = 0; i < rowItems.length; i++) ...[
                if (i > 0) const SizedBox(width: 16),
                Expanded(
                  child: ProjectCard(project: rowItems[i])
                      .animate()
                      .fadeIn(
                        delay: Duration(milliseconds: (start + i) * 100),
                        duration: 600.ms,
                      )
                      .slideY(begin: 0.15, curve: Curves.easeOut),
                ),
              ],
              for (int j = rowItems.length; j < cols; j++) ...[
                if (rowItems.isNotEmpty || j > 0) const SizedBox(width: 16),
                const Expanded(child: SizedBox()),
              ],
            ],
          ),
        );
      }),
    );
  }
}
