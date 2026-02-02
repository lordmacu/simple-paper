import 'package:flutter/material.dart';

/// Tipos de categorías de repaso.
enum ReviewCategoryType {
  /// Verbos irregulares.
  irregularVerbs,

  /// Países y nacionalidades.
  countries,

  /// Ciudades.
  cities,

  /// Adjetivos comparativos.
  comparatives,
}

/// Tipos de juegos de repaso.
enum ReviewGameType {
  /// Juego de emparejamiento.
  matching,

  /// Opción múltiple.
  multipleChoice,

  /// Completar espacios.
  fillBlank,

  /// Tarjetas de memoria.
  flashcard,

  /// Ordenar formas.
  orderForms,

  /// Escribir respuesta.
  typing,

  /// Verdadero o falso.
  trueFalse,

  /// Juego de memoria.
  memory,

  /// Bingo.
  bingo,
}

/// Categoría de repaso con metadata visual.
class ReviewCategory {
  /// Tipo de categoría.
  final ReviewCategoryType type;

  /// Título de la categoría.
  final String title;

  /// Subtítulo descriptivo.
  final String subtitle;

  /// Ícono de la categoría.
  final IconData icon;

  /// Crea un [ReviewCategory].
  const ReviewCategory({
    required this.type,
    required this.title,
    required this.subtitle,
    required this.icon,
  });
}
