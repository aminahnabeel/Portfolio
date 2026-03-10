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
      tagline: 'AI-powered peer-to-peer skill exchange platform',
      description:
          'A smart platform that connects learners and teachers through '
          'AI-based matching. Users exchange skills, track progress, and '
          'grow together — no money involved, just knowledge.',
      tags: ['Flutter', 'Firebase', 'AI / ML', 'REST APIs'],
      gradientColors: const [Color(0xFF9747FF), Color(0xFF6B35CF)],
      linkedinUrl: 'https://www.linkedin.com/in/aminah-arshad-/',
    ),
    ProjectModel(
      title: 'Traffic Sign Recognition',
      tagline: 'CNN model for real-time traffic sign detection',
      description:
          'A deep-learning system that detects and classifies traffic signs '
          'from images with 97 % accuracy. Trained on a large dataset using '
          'TensorFlow and optimized for edge deployment.',
      tags: ['Python', 'TensorFlow', 'CNN', 'AI / ML'],
      gradientColors: const [Color(0xFFFE814C), Color(0xFFFF5733)],
      linkedinUrl: 'https://www.linkedin.com/in/aminah-arshad-/',
    ),
    ProjectModel(
      title: 'Docker Ecommerce',
      tagline: 'Fully containerized scalable ecommerce solution',
      description:
          'A production-ready ecommerce backend containerized with Docker '
          'and orchestrated via Docker Compose, featuring cart, auth, and '
          'product microservices communicating over REST.',
      tags: ['Docker', 'Node.js', 'MongoDB', 'REST APIs'],
      gradientColors: const [Color(0xFF4776E6), Color(0xFF8E54E9)],
      linkedinUrl: 'https://www.linkedin.com/in/aminah-arshad-/',
    ),
    ProjectModel(
      title: 'ConnecFriend',
      tagline: 'Social app connecting people with shared interests',
      description:
          'A Flutter-based social networking app with real-time messaging, '
          'interest-based matching, and a Firebase backend. Built for '
          'meaningful connections beyond location.',
      tags: ['Flutter', 'Firebase', 'UI / UX'],
      gradientColors: const [Color(0xFF11998E), Color(0xFF38EF7D)],
      linkedinUrl: 'https://www.linkedin.com/in/aminah-arshad-/',
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
