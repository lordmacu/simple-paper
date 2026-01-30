import '../content_wrappers/content_wrappers.dart';

class MiniStorySection {
  final String? sectionName;
  final String? sectionNameEs;
  final String? image;
  final String? title;
  final String? titleEs;
  final String? description;
  final String? descriptionEs;
  final List<MiniStoryParagraph> paragraphs;

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

class MiniStoryParagraph {
  final String id;
  final BilingualText text;

  const MiniStoryParagraph({
    required this.id,
    required this.text,
  });

  factory MiniStoryParagraph.fromJson(Map<String, dynamic> json) {
    return MiniStoryParagraph(
      id: json['id'] as String? ?? '',
      text: BilingualText.fromJson(json['text'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text.toJson(),
    };
  }
}
