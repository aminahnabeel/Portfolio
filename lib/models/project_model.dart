import 'package:flutter/material.dart';

class ProjectModel {
  final String title;
  final String description;
  final List<String> tags;
  final List<Color> gradientColors;

  const ProjectModel({
    required this.title,
    required this.description,
    required this.tags,
    required this.gradientColors,
  });
}
