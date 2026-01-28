import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_colors.dart';
import '../../providers/template_variable_provider.dart';

/// Datos mínimos para renderizar la entrevista del personaje.
class CharacterInterview {
  final String characterName;
  final String avatarUrl;
  final int episodeNumber;
  final String introEn;
  final String introEs;
  final List<String> grammarPoints;
  final List<String> vocabularyUsed;
  final List<InterviewQuestion> questions;

  const CharacterInterview({
    required this.characterName,
    required this.avatarUrl,
    required this.episodeNumber,
    required this.introEn,
    required this.introEs,
    this.grammarPoints = const [],
    this.vocabularyUsed = const [],
    required this.questions,
  });
}

class InterviewQuestion {
  final String questionEn;
  final String questionEs;
  final List<InterviewOption> options;

  const InterviewQuestion({
    required this.questionEn,
    required this.questionEs,
    required this.options,
  });
}

class InterviewOption {
  final String optionId;
  final String textEn;
  final String textEs;
  final bool isCorrect;
  final String feedbackEn;
  final String feedbackEs;
  final String? grammarExplanation;
  final String? culturalNote;
  final String? mistakeType;

  const InterviewOption({
    required this.optionId,
    required this.textEn,
    required this.textEs,
    required this.isCorrect,
    required this.feedbackEn,
    required this.feedbackEs,
    this.grammarExplanation,
    this.culturalNote,
    this.mistakeType,
  });
}

/// Pantalla principal de entrevista de personaje.
class CharacterInterviewScreen extends ConsumerStatefulWidget {
  final CharacterInterview interview;
  final void Function(int correct, int total) onComplete;

  const CharacterInterviewScreen({
    Key? key,
    required this.interview,
    required this.onComplete,
  }) : super(key: key);

  @override
  ConsumerState<CharacterInterviewScreen> createState() =>
      _CharacterInterviewScreenState();
}

class _CharacterInterviewScreenState
    extends ConsumerState<CharacterInterviewScreen> {
  int _currentIndex = 0;
  int _correct = 0;
  int _selectedIndex = -1;
  bool _showFeedback = false;
  late final PageController _pageController;
  double _progressAnim = 0;

  InterviewQuestion get _question => widget.interview.questions[_currentIndex];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _progressAnim = _progressValue;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _select(int index) {
    if (_showFeedback) return;
    final option = _question.options[index];
    setState(() {
      _selectedIndex = index;
      _showFeedback = true;
      if (option.isCorrect) _correct++;
    });
    _animateProgress();
  }

  void _next() {
    final isLast = _currentIndex == widget.interview.questions.length - 1;
    if (isLast) {
      widget.onComplete(_correct, widget.interview.questions.length);
      return;
    }
    setState(() {
      _currentIndex++;
      _selectedIndex = -1;
      _showFeedback = false;
    });
    _pageController.nextPage(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOutCubic,
    );
    _animateProgress();
  }

  double get _progressValue =>
      (_currentIndex + 1) / widget.interview.questions.length;

  void _animateProgress() {
    final target = _progressValue;
    setState(() {
      _progressAnim = target;
    });
  }

  String _applyVars(String text) {
    return ref.read(templateVariableServiceProvider).replaceVariables(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Entrevista: ${widget.interview.characterName}',
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
            Text(
              'Episodio ${widget.interview.episodeNumber}',
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: LinearProgressIndicator(
                      value: _progressAnim,
                      backgroundColor: AppColors.cardBackground,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        AppColors.secondaryBlue,
                      ),
                      minHeight: 10,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: Text(
                        'Pregunta ${_currentIndex + 1} de ${widget.interview.questions.length}',
                        key: ValueKey(_currentIndex),
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: Text(
                        'Aciertos: $_correct',
                        key: ValueKey(_correct),
                        style: const TextStyle(
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: _IntroCard(
              characterName: widget.interview.characterName,
              avatarUrl: widget.interview.avatarUrl,
              introEn: _applyVars(widget.interview.introEn),
              introEs: _applyVars(widget.interview.introEs),
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.interview.questions.length,
              itemBuilder: (_, index) => _QuestionCard(
                question: widget.interview.questions[index],
                selectedIndex:
                    index == _currentIndex ? _selectedIndex : -1,
                showFeedback: index == _currentIndex && _showFeedback,
                onTap: (i) => _select(i),
                apply: _applyVars,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _showFeedback
                      ? AppColors.primaryGreen
                      : AppColors.cardBackground,
                  foregroundColor:
                      _showFeedback ? Colors.white : AppColors.textSecondary,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: _showFeedback ? _next : null,
                child: Text(
                  _currentIndex == widget.interview.questions.length - 1
                      ? 'Terminar'
                      : 'Continuar',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _IntroCard extends StatelessWidget {
  final String characterName;
  final String avatarUrl;
  final String introEn;
  final String introEs;

  const _IntroCard({
    required this.characterName,
    required this.avatarUrl,
    required this.introEn,
    required this.introEs,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 26,
                backgroundColor: AppColors.secondaryBlue.withOpacity(0.15),
                backgroundImage:
                    avatarUrl.isNotEmpty ? NetworkImage(avatarUrl) : null,
                child: avatarUrl.isEmpty
                    ? const Icon(Icons.person, color: AppColors.secondaryBlue)
                    : null,
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    characterName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Character Interview',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            introEn,
            style: const TextStyle(
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            introEs,
            style: const TextStyle(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _QuestionCard extends StatelessWidget {
  final InterviewQuestion question;
  final int selectedIndex;
  final bool showFeedback;
  final ValueChanged<int> onTap;
  final String Function(String) apply;

  const _QuestionCard({
    required this.question,
    required this.selectedIndex,
    required this.showFeedback,
    required this.onTap,
    required this.apply,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              apply(question.questionEn),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              apply(question.questionEs),
              style: const TextStyle(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 12),
            ...question.options.asMap().entries.map(
              (entry) {
                final idx = entry.key;
                final opt = entry.value;
                final isSelected = selectedIndex == idx;
                final isCorrect = opt.isCorrect;
                Color bg = AppColors.cardBackground;
                Color fg = AppColors.textPrimary;
                final bool show = showFeedback && isSelected;
                final letter = opt.optionId.isNotEmpty
                    ? opt.optionId
                    : String.fromCharCode(65 + idx);

                if (show) {
                  bg = isCorrect ? AppColors.primaryGreen : AppColors.errorRed;
                  fg = Colors.white;
                }

                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: InkWell(
                    onTap: () => onTap(idx),
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: bg,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: showFeedback && isSelected
                              ? Colors.transparent
                              : AppColors.cardBackground,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                             Container(
                               width: 32,
                               height: 32,
                               decoration: BoxDecoration(
                                 color: show
                                     ? Colors.white.withOpacity(0.25)
                                     : AppColors.cardBackground,
                                 shape: BoxShape.circle,
                               ),
                               child: Center(
                                 child: Text(
                                   letter,
                                   style: TextStyle(
                                     fontWeight: FontWeight.bold,
                                      color: show ? Colors.white : AppColors.textSecondary,
                                    ),
                                 ),
                               ),
                             ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      apply(opt.textEn),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: fg,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      apply(opt.textEs),
                                      style: TextStyle(
                                        color: show
                                            ? Colors.white70
                                            : AppColors.textSecondary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (show)
                                Icon(
                                  isCorrect ? Icons.check_circle : Icons.cancel,
                                  color: Colors.white,
                                ),
                            ],
                          ),
                          if (show) ...[
                            const SizedBox(height: 10),
                            Text(
                              apply(opt.isCorrect ? opt.feedbackEn : opt.feedbackEs),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            if ((opt.mistakeType ?? '').isNotEmpty) ...[
                              const SizedBox(height: 6),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  'Tipo de error: ${opt.mistakeType}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                            if ((opt.grammarExplanation ?? '').isNotEmpty) ...[
                              const SizedBox(height: 8),
                              Text(
                                'Grammar: ${apply(opt.grammarExplanation ?? '')}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                            if ((opt.culturalNote ?? '').isNotEmpty) ...[
                              const SizedBox(height: 6),
                              Text(
                                'Cultura: ${apply(opt.culturalNote ?? '')}',
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ],
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            if (showFeedback && selectedIndex >= 0)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  children: [
                    const Icon(Icons.info_outline, color: AppColors.textSecondary, size: 18),
                    const SizedBox(width: 6),
                    Text(
                      'Toca continuar para la siguiente pregunta',
                      style: const TextStyle(color: AppColors.textSecondary),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
