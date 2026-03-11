import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../constants/app_data.dart';
import '../widgets/section_title.dart';

/// Awards and certificates section — editorial intro with a responsive card grid.
class AwardsSection extends StatelessWidget {
  const AwardsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 1024;
    final horizontalPadding = isDesktop ? 100.0 : 24.0;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 90),
      child: Column(
        children: [
          SectionTitle(
            title: 'Awards & Certificates',
            subtitle:
                'From merit scholarships to platform training, these milestones strengthen the foundation behind my technical and creative work.',
          ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2),
          const SizedBox(height: 75),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: isDesktop ? 1240 : 760),
            child: const _AwardsGrid(),
          ),
        ],
      ),
    );
  }
}

class _AwardsGrid extends StatelessWidget {
  const _AwardsGrid();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 1024;
    final isTablet = width >= 700;
    final items = AppData.certificates;

    if (isDesktop) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < items.length; i++) ...[
            if (i > 0) const SizedBox(width: 28),
            Expanded(
              child: SizedBox(
                height: 360,
                child: _AwardCard(data: items[i], index: i),
              ),
            ),
          ],
        ],
      );
    }

    final columns = isTablet ? 2 : 1;
    final rows = (items.length / columns).ceil();

    return Column(
      children: List.generate(rows, (row) {
        final start = row * columns;
        final end = (start + columns).clamp(0, items.length);
        final rowItems = items.sublist(start, end);

        return Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int i = 0; i < rowItems.length; i++) ...[
                if (i > 0) const SizedBox(width: 24),
                Expanded(
                  child: SizedBox(
                    height: 340,
                    child: _AwardCard(data: rowItems[i], index: start + i),
                  ),
                ),
              ],
              for (int j = rowItems.length; j < columns; j++) ...[
                if (j > 0 || rowItems.isNotEmpty) const SizedBox(width: 24),
                const Expanded(child: SizedBox()),
              ],
            ],
          ),
        );
      }),
    );
  }
}

class _AwardCard extends StatefulWidget {
  final Map<String, String> data;
  final int index;

  const _AwardCard({required this.data, required this.index});

  @override
  State<_AwardCard> createState() => _AwardCardState();
}

class _AwardCardState extends State<_AwardCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final icon = _iconFor(widget.data['icon']);
    final isAward = (widget.data['type'] ?? '').toLowerCase() == 'award';
    final accentStart = isAward ? AppColors.orange : AppColors.purple;
    final accentEnd = isAward ? const Color(0xFFFFB36A) : const Color(0xFF6F7CFF);
    final chipColor = isAward
        ? AppColors.orange.withValues(alpha: 0.14)
        : AppColors.purple.withValues(alpha: 0.14);
    final borderColor = isAward
        ? AppColors.orange.withValues(alpha: _hovered ? 0.28 : 0.14)
        : AppColors.purple.withValues(alpha: _hovered ? 0.24 : 0.12);
    final shadowColor = isAward
        ? AppColors.orange.withValues(alpha: _hovered ? 0.18 : 0.10)
        : AppColors.purple.withValues(alpha: _hovered ? 0.16 : 0.08);

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 280),
        curve: Curves.easeOut,
        transform: Matrix4.translationValues(0, _hovered ? -6 : 0, 0),
        padding: const EdgeInsets.fromLTRB(18, 18, 18, 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white.withValues(alpha: _hovered ? 0.07 : 0.05),
              Colors.white.withValues(alpha: _hovered ? 0.035 : 0.018),
            ],
          ),
          border: Border.all(
            color: borderColor,
          ),
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              blurRadius: _hovered ? 28 : 18,
              spreadRadius: -6,
              offset: const Offset(0, 16),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [accentStart, accentEnd],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: shadowColor,
                        blurRadius: 18,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Icon(icon, color: Colors.white, size: 22),
                ),
                const Spacer(),
                if ((widget.data['year'] ?? '').isNotEmpty)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(999),
                      color: Colors.white.withValues(alpha: 0.05),
                    ),
                    child: Text(
                      widget.data['year'] ?? '',
                      style: GoogleFonts.kanit(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
                color: chipColor,
              ),
              child: Text(
                widget.data['type'] ?? '',
                style: GoogleFonts.kanit(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.8,
                  color: isAward ? const Color(0xFFFFC89B) : const Color(0xFFC9B6FF),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              widget.data['title'] ?? '',
              style: GoogleFonts.kanit(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                height: 1.2,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.data['issuer'] ?? '',
              style: GoogleFonts.kanit(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: isAward ? const Color(0xFFFFB678) : const Color(0xFF9C8BFF),
              ),
            ),
            const SizedBox(height: 14),
            Container(
              height: 1,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    accentStart.withValues(alpha: 0.28),
                    accentEnd.withValues(alpha: 0.15),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            const SizedBox(height: 14),
            Expanded(
              child: Text(
                widget.data['summary'] ?? '',
                style: GoogleFonts.kanit(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  height: 1.65,
                  color: AppColors.textSecondary,
                ),
              ),
            ),
          ],
        ),
      )
          .animate()
          .fadeIn(
            delay: Duration(milliseconds: widget.index * 110),
            duration: 650.ms,
          )
          .slideY(begin: 0.08, curve: Curves.easeOut),
    );
  }

  IconData _iconFor(String? key) {
    switch (key) {
      case 'flutter':
        return Icons.phone_android_rounded;
      case 'cloud':
        return Icons.cloud_done_rounded;
      case 'design':
        return Icons.palette_rounded;
      case 'ai':
        return Icons.psychology_rounded;
      case 'award':
      default:
        return Icons.workspace_premium_rounded;
    }
  }
}