import '../../../domain/models/game/game.dart';

class ReviewOrderFormsGame implements Game {
  @override
  final String gameId;

  @override
  final String gameType;

  @override
  final String title;

  @override
  final String titleEs;

  @override
  final String instructions;

  @override
  final String instructionsEs;

  final List<ReviewOrderFormsItem> items;

  ReviewOrderFormsGame({
    required this.gameId,
    required this.gameType,
    required this.title,
    required this.titleEs,
    required this.instructions,
    required this.instructionsEs,
    required this.items,
  });

  @override
  bool get optional => true;

  @override
  bool get unlockedAfterEpisode => true;

  @override
  int? get timeLimitSeconds => null;

  @override
  int get xpReward => 0;

  @override
  Map<String, dynamic> toJson() => {
        'game_id': gameId,
        'game_type': gameType,
        'title': title,
        'title_es': titleEs,
        'instructions': instructions,
        'instructions_es': instructionsEs,
      };

  @override
  bool validateAnswer(dynamic answer) => false;

  @override
  int calculateScore(List answers, {int? timeSpent}) => 0;
}

class ReviewOrderFormsItem {
  final String base;
  final String past;
  final String participle;

  const ReviewOrderFormsItem({
    required this.base,
    required this.past,
    required this.participle,
  });
}
