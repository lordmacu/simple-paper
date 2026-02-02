import 'package:flutter/material.dart';

/// Retorna un ícono representativo para una palabra específica.
///
/// Mapea palabras comunes de oficina a íconos relevantes.
IconData vocabularyIconForWord(String word) {
  final wordLower = word.toLowerCase();
  switch (wordLower) {
    case 'office':
      return Icons.business;
    case 'boss':
      return Icons.person;
    case 'desk':
      return Icons.desk;
    case 'hello':
      return Icons.waving_hand;
    case 'meeting':
      return Icons.groups;
    case 'computer':
      return Icons.computer;
    case 'phone':
      return Icons.phone;
    case 'paper':
      return Icons.description;
    case 'coffee':
      return Icons.coffee;
    case 'work':
      return Icons.work;
    default:
      return Icons.book;
  }
}

/// Retorna un ícono según el tipo de palabra gramatical.
///
/// Soporta sustantivos, verbos, adjetivos, adverbios y preposiciones.
IconData vocabularyIconForType(String wordType) {
  final type = wordType.toLowerCase();
  if (type.contains('noun') || type.contains('sustantivo')) {
    return Icons.label;
  }
  if (type.contains('verb') || type.contains('verbo')) {
    return Icons.play_arrow;
  }
  if (type.contains('adjective') || type.contains('adjetivo')) {
    return Icons.style;
  }
  if (type.contains('adverb') || type.contains('adverbio')) {
    return Icons.speed;
  }
  if (type.contains('preposition') || type.contains('preposición')) {
    return Icons.arrow_forward;
  }
  return Icons.text_fields;
}
