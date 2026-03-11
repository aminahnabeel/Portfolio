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
          'A smart platform that that lets users learn, teach, and collaborate freely. '
          'AI-based matching. Users exchange skills, track progress, and '
          'grow together — no money involved, just knowledge.',
      tags: ['Flutter', 'Firebase', 'AI / ML'],
      gradientColors: const [Color(0xFF9747FF), Color(0xFF6B35CF)],
      linkedinUrl: 'https://www.linkedin.com/feed/update/urn:li:activity:7421854717712125953/?utm_source=share&utm_medium=member_desktop&rcm=ACoAADff8NkBJYKXRXbY7dcSPfOR8m5VmihQg1I',
    ),
    ProjectModel(
      title: 'Traffic Sign Recognition',
      tagline: 'CNN model for real-time traffic sign detection',
      description:
          'A deep-learning system that detects and classifies traffic signs '
          'from images with 95 % accuracy. Trained on a large dataset using '
          'TensorFlow and optimized for edge deployment.',
      tags: ['Python', 'TensorFlow', 'CNN', 'Keras'],
      gradientColors: const [Color(0xFFFE814C), Color(0xFFFF5733)],
      linkedinUrl: 'https://www.linkedin.com/posts/aminah-nabeel-249b36221_machinelearning-deeplearning-python-ugcPost-7351923521767321602-kV4Y?utm_source=share&utm_medium=member_desktop&rcm=ACoAADff8NkBJYKXRXbY7dcSPfOR8m5VmihQg1I',
    ),
    ProjectModel(
      title: 'Docker Ecommerce',
      tagline: 'Fully containerized scalable ecommerce solution',
      description:
          'A production-ready ecommerce backend containerized with Docker '
          'and orchestrated via Docker Compose, featuring cart, auth, and '
          'product microservices communicating over REST.',
      tags: ['Docker', 'Node.js', 'HTML', 'CSS'],
      gradientColors: const [Color(0xFF4776E6), Color(0xFF8E54E9)],
      linkedinUrl: 'https://www.linkedin.com/feed/update/urn:li:activity:7437172163872448512/?utm_source=share&utm_medium=member_desktop&rcm=ACoAADff8NkBJYKXRXbY7dcSPfOR8m5VmihQg1I',
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
      'duration':    '07/2025 – 08/2025',

      'description': 'Developed multiple Flutter applications with clean '
          'architecture, Firebase integration, and responsive UI design for '
          'real-world clients.',
    },
    {
      'role':        'Web Development & Research Intern (Remote)',
      'company':     'Insafdaar Organization',
      'duration':    '07/2024 – 09/2024',
      'description': 'Built responsive web interfaces and conducted UX '
          'research for digital civic-engagement platforms, improving '
          'user retention.',
    },
  ];

  // ── Awards & certificates ──────────────────────────────────────────────────
  static const List<Map<String, String>> certificates = [
    {
      'title': 'BU Merit Scholarships',
      'issuer': 'Bahria University Islamabad',
      'year': '2023 - 2025',
      'type': 'Award',
      'summary': 'Awarded for academic excellence, securing multiple merit scholarships.',
      'icon': 'award',
    },
    {
      'title': 'Freelancing Training Certificate',
      'issuer': 'Digiskills',
      'year': '',
      'type': 'Certificate',
      'summary': 'Freelancing training certificate awarded by Digiskills.',
      'icon': 'award',
    },
    {
      'title': 'WordPress Training Certificate',
      'issuer': 'Digiskills',
      'year': '',
      'type': 'Certificate',
      'summary': 'WordPress training certificate awarded by Digiskills.',
      'icon': 'award',
    },
    {
      'title': 'Introduction to Generative AI',
      'issuer': 'Coursera',
      'year': '',
      'type': 'Certificate',
      'summary': 'Introduction to Generative AI certificate from Coursera.',
      'icon': 'award',
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
