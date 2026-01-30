import 'dart:convert';
import 'character_interview_screen.dart';

class InterviewParser {
  static CharacterInterview? parse(
    String jsonString, {
    required int episodeNumber,
    required String fallbackName,
  }) {
    final Map<String, dynamic> data =
        jsonDecode(jsonString)['character_interview'];
    final questions = (data['questions'] as List<dynamic>).map((q) {
      final opts = (q['options'] as List<dynamic>).map((o) {
        return InterviewOption(
          optionId: o['option_id'] ?? '',
          textEn: o['text_en'] ?? '',
          textEs: o['text_es'] ?? '',
          isCorrect: o['is_correct'] ?? false,
          feedbackEn: o['feedback_en'] ?? '',
          feedbackEs: o['feedback_es'] ?? '',
          grammarExplanation: o['grammar_explanation'],
          culturalNote: o['cultural_note'],
          mistakeType: o['mistake_type'],
        );
      }).toList();

      return InterviewQuestion(
        questionEn: q['question']['text_en'] ?? '',
        questionEs: q['question']['text_es'] ?? '',
        options: opts,
      );
    }).toList();

    final focus = data['pedagogical_focus'] as Map<String, dynamic>?;
    final grammarPoints = (focus?['grammar_points'] as List<dynamic>?)
            ?.map((e) => e.toString())
            .toList() ??
        const <String>[];
    final vocabularyUsed = (focus?['vocabulary_used'] as List<dynamic>?)
            ?.map((e) => e.toString())
            .toList() ??
        const <String>[];

    return CharacterInterview(
      characterName: data['character_name'] ?? fallbackName,
      avatarUrl: data['avatar_url'] ?? '',
      episodeNumber: episodeNumber,
      introEn: data['introduction']['text_en'] ?? '',
      introEs: data['introduction']['text_es'] ?? '',
      characterGender: (data['character_gender'] ?? '').toString(),
      grammarPoints: grammarPoints,
      vocabularyUsed: vocabularyUsed,
      questions: questions,
    );
  }
}
