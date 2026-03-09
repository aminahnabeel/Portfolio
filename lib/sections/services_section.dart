import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../constants/app_data.dart';
import '../widgets/section_title.dart';
import '../widgets/service_card.dart';

/// Services section — 3 cards in a row (desktop) or stacked column (mobile).
class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isDesktop = w >= 1024;
    final hPad = isDesktop ? 80.0 : 24.0;

    return Container(
      color: const Color(0xFF050505),
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 80),
      child: Column(
        children: [
          // Section heading
          SectionTitle(
            title: 'My Services',
            subtitle:
                'I craft high-quality digital solutions — from sleek Flutter '
                'apps and immersive UX to intelligent AI-driven features.',
          ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2),
          const SizedBox(height: 56),

          // Cards
          isDesktop ? _buildRow() : _buildColumn(),
        ],
      ),
    );
  }

  Widget _buildRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(AppData.services.length, (i) {
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              left:  i == 0 ? 0 : 10,
              right: i == AppData.services.length - 1 ? 0 : 10,
            ),
            child: ServiceCard(service: AppData.services[i])
                .animate()
                .fadeIn(delay: (i * 150).ms, duration: 600.ms)
                .slideY(begin: 0.2, curve: Curves.easeOut),
          ),
        );
      }),
    );
  }

  Widget _buildColumn() {
    return Column(
      children: List.generate(AppData.services.length, (i) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: ServiceCard(service: AppData.services[i])
              .animate()
              .fadeIn(delay: (i * 150).ms, duration: 600.ms),
        );
      }),
    );
  }
}
