import 'package:flutter/material.dart';
import '../models/project_model.dart';
import '../models/service_model.dart';

/// All static content / copy used across the portfolio.
class AppData {
  AppData._();

  // ── Navigation ──────────────────────────────────────────────────────────────
  static const List<String> navLinks = [
    'Home',
    'About',
    'Services',
    'Works',
    'Testimonials',
    'Contact',
  ];

  // ── Stats ────────────────────────────────────────────────────────────────────
  static const List<Map<String, String>> stats = [
    {'number': '4',  'suffix': ' +', 'label': 'Projects',     'icon': 'rocket'},
    {'number': '2',  'suffix': '',  'label': 'Internships',  'icon': 'work'},
    {'number': '5',  'suffix': ' +', 'label': 'Certificates', 'icon': 'award'},
  ];

  // ── Services ─────────────────────────────────────────────────────────────────
  static final List<ServiceModel> services = [
    ServiceModel(
      title: 'Flutter App Development',
      description:
          'Building performant, beautiful cross-platform mobile & web apps '
          'using Flutter and Dart with clean architecture.',
      gradientColors: const [Color(0xFF9747FF), Color(0xFF6B35CF)],
      icon: Icons.phone_android_rounded,
    ),
    ServiceModel(
      title: 'UI/UX Design',
      description:
          'Crafting intuitive, pixel-perfect user interfaces with modern '
          'design principles and stunning visual hierarchy.',
      gradientColors: const [Color(0xFFFE814C), Color(0xFFFF5733)],
      icon: Icons.design_services_rounded,
    ),
    ServiceModel(
      title: 'AI Integration',
      description:
          'Integrating machine learning and AI capabilities into modern '
          'applications, from model training to deployment.',
      gradientColors: const [Color(0xFF4776E6), Color(0xFF8E54E9)],
      icon: Icons.psychology_rounded,
    ),
  ];

  // ── Projects ─────────────────────────────────────────────────────────────────
  static final List<ProjectModel> projects = [
    ProjectModel(
      title: 'SkillSwap',
      description:
          'AI-powered skill exchange platform. Connect, learn, and grow '
          'through peer-to-peer skill sharing with smart matching.',
      tags: ['Flutter', 'Firebase', 'AI'],
      gradientColors: const [Color(0xFF9747FF), Color(0xFF6B35CF)],
    ),
    ProjectModel(
      title: 'Traffic Sign Recognition',
      description:
          'CNN-based traffic sign detection and classification system '
          'built with TensorFlow achieving 97 % accuracy.',
      tags: ['Python', 'TensorFlow', 'CNN'],
      gradientColors: const [Color(0xFFFE814C), Color(0xFFFF5733)],
    ),
    ProjectModel(
      title: 'Docker Ecommerce Platform',
      description:
          'Scalable ecommerce solution fully containerized with Docker '
          'and orchestrated with Docker Compose.',
      tags: ['Docker', 'Node.js', 'MongoDB'],
      gradientColors: const [Color(0xFF4776E6), Color(0xFF8E54E9)],
    ),
    ProjectModel(
      title: 'ConnecFriend',
      description:
          'Social networking platform connecting people with shared '
          'interests and real-time messaging.',
      tags: ['Flutter', 'Firebase', 'Social'],
      gradientColors: const [Color(0xFF11998E), Color(0xFF38EF7D)],
    ),
  ];

  // ── Experience ───────────────────────────────────────────────────────────────
  static const List<Map<String, String>> experience = [
    {
      'role':        'Mobile App Development Intern',
      'company':     'Esols Technologies',
      'duration':    'Summer 2024',
      'description': 'Developed multiple Flutter applications with clean '
          'architecture, Firebase integration, and responsive UI design for '
          'real-world clients.',
    },
    {
      'role':        'Web Development & Research Intern',
      'company':     'Insafdaar Organization',
      'duration':    '2023',
      'description': 'Built responsive web interfaces and conducted UX '
          'research for digital civic-engagement platforms, improving '
          'user retention.',
    },
  ];

  // ── Testimonials ─────────────────────────────────────────────────────────────
  static const List<Map<String, String>> testimonials = [
    {
      'name':     'Jason Miller',
      'role':     'Client Work',
      'initials': 'JM',
      'text':
          'Aminah delivered excellent UI and development work. The app exceeded '
          'our expectations in both design and functionality. Highly recommended!',
    },
    {
      'name':     'Sarah Chen',
      'role':     'Project Collaborator',
      'initials': 'SC',
      'text':
          'Working with Aminah was a fantastic experience. Her attention to '
          'detail and clean code really made a difference in our deliverables.',
    },
    {
      'name':     'Ahmed Khan',
      'role':     'Startup Founder',
      'initials': 'AK',
      'text':
          "Aminah's Flutter expertise and AI integration knowledge helped us "
          "launch our product on time. She's talented, reliable, and a true gem!",
    },
  ];

  // ── Social links ─────────────────────────────────────────────────────────────
  static const String linkedInUrl  = 'https://linkedin.com';
  static const String githubUrl    = 'https://github.com';
  static const String instagramUrl = 'https://instagram.com';
  static const String behanceUrl   = 'https://behance.net';
}
