// Data Models
import 'package:flutter/material.dart';

class Injury {
  final String id;
  final String name;
  final String description;
  final List<String> symptoms;
  final List<String> firstAidSteps;
  final String? warnings;
  final IconData icon;

  Injury({
    required this.id,
    required this.name,
    required this.description,
    required this.symptoms,
    required this.firstAidSteps,
    this.warnings,
    required this.icon,
  });
}
