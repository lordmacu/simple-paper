import '../content_wrappers/content_wrappers.dart';

/// Sección de mini historia con párrafos bilingües.
class MiniStorySection {
  /// Nombre corto de la sección.
  final String? sectionName;

  /// Nombre en español.
  final String? sectionNameEs;

  /// Imagen de la sección.
  final String? image;

  /// Título de la historia.
  final String? title;

  /// Título en español.
  final String? titleEs;

  /// Descripción de la historia.
  final String? description;

  /// Descripción en español.
  final String? descriptionEs;

  /// Lista de párrafos.
  final List<MiniStoryParagraph> paragraphs;

  /// Crea un [MiniStorySection].
  const MiniStorySection({
    this.sectionName,
    this.sectionNameEs,
    this.image,
    this.title,
    this.titleEs,
    this.description,
    this.descriptionEs,
    this.paragraphs = const [],
  });

  /// Crea desde JSON.
  factory MiniStorySection.fromJson(Map<String, dynamic> json) {
    return MiniStorySection(
      sectionName: json['section_name'] as String?,
      sectionNameEs: json['section_name_es'] as String?,
      image: json['image'] as String?,
      title: json['title'] as String?,
      titleEs: json['title_es'] as String?,
      description: json['description'] as String?,
      descriptionEs: json['description_es'] as String?,
      paragraphs: (json['paragraphs'] as List<dynamic>?)
              ?.map(
                (item) => MiniStoryParagraph.fromJson(
                  item as Map<String, dynamic>,
                ),
              )
              .toList() ??
          const [],
    );
  }

  /// Convierte a JSON.
  Map<String, dynamic> toJson() {
    return {
      'section_name': sectionName,
      'section_name_es': sectionNameEs,
      'image': image,
      'title': title,
      'title_es': titleEs,
      'description': description,
      'description_es': descriptionEs,
      'paragraphs': paragraphs.map((p) => p.toJson()).toList(),
    };
  }
}

/// Párrafo de mini historia.
class MiniStoryParagraph {
  /// ID único del párrafo.
  final String id;

  /// Texto bilingüe del párrafo.
  final BilingualText text;

  /// Crea un [MiniStoryParagraph].
  const MiniStoryParagraph({
    required this.id,
    required this.text,
  });

  /// Crea desde JSON.
  factory MiniStoryParagraph.fromJson(Map<String, dynamic> json) {
    return MiniStoryParagraph(
      id: json['id'] as String? ?? '',
      text: BilingualText.fromJson(json['text'] as Map<String, dynamic>),
    );
  }

  /// Convierte a JSON.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text.toJson(),
    };
  }
}
