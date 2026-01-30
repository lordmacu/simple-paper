import 'package:flutter/material.dart';

enum ReviewCategoryType {
  irregularVerbs,
  countries,
  cities,
  comparatives,
}

enum ReviewGameType {
  matching,
  multipleChoice,
  fillBlank,
  flashcard,
  orderForms,
  typing,
  trueFalse,
  memory,
  bingo,
}

class ReviewCategory {
  final ReviewCategoryType type;
  final String title;
  final String subtitle;
  final IconData icon;

  const ReviewCategory({
    required this.type,
    required this.title,
    required this.subtitle,
    required this.icon,
  });
}
