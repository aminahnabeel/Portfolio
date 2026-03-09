import 'package:flutter/material.dart';

class ServiceModel {
  final String title;
  final String description;
  final List<Color> gradientColors;
  final IconData icon;

  const ServiceModel({
    required this.title,
    required this.description,
    required this.gradientColors,
    required this.icon,
  });
}
