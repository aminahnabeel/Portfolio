import 'package:flutter/material.dart';

class ProjectModel {
  final String title;
  final String tagline;
  final String description;
  final List<String> tags;
  final List<Color> gradientColors;
  final String linkedinUrl;

  const ProjectModel({
    required this.title,
    required this.tagline,
    required this.description,
    required this.tags,
    required this.gradientColors,
    this.linkedinUrl = '',
  });
}
