import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/constants/app_colors.dart';
import '../../widgets/atoms/icon_text_button.dart';
import '../../widgets/molecules/bilingual_text_card.dart';
import '../../widgets/organisms/review_game_scaffold.dart';
import '../../widgets/molecules/review_header_row.dart';
import '../../widgets/molecules/score_footer.dart';
import 'review_true_false_game.dart';

/// review true false screen/widget
class ReviewTrueFalseWidget extends StatefulWidget {
  ///  review true false game
  final ReviewTrueFalseGame game;
  /// Callback cuando se completa el juego
  final ValueChanged<int> onComplete;

  /// Crea un widget de juego verdadero/falso de revisión.
  const ReviewTrueFalseWidget({
    required this.game, required this.onComplete, super.key,
  });

  @override
  State<ReviewTrueFalseWidget> createState() => _ReviewTrueFalseWidgetState();
}

class _ReviewTrueFalseWidgetState extends State<ReviewTrueFalseWidget> {
  int _index = 0;
  int _score = 0;
  bool _locked = false;
  bool? _selectedTrue;
  final List<Map<int, bool>> _answers = [];

  ReviewTrueFalseItem get _item => widget.game.items[_index];
  int get _total => widget.game.items.length;

  void _answer(bool value) {
    if (_locked) {
      return;
    }
    
    // Crear respuesta en formato esperado por el modelo
    final answer = {_index: value};
    final isCorrect = widget.game.validateAnswer(answer);
    
    setState(() {
      _selectedTrue = value;
      _locked = true;
    });
    
    // Agregar respuesta a la lista para scoring final
    _answers.add(answer);
    
    if (isCorrect) {
      HapticFeedback.lightImpact();
    } else {
      HapticFeedback.mediumImpact();
    }
    Future.delayed(const Duration(milliseconds: 900), _next);
  }

  void _next() {
    if (!mounted) {
      return;
    }
    if (_index + 1 >= _total) {
      // Calcular score final usando el modelo
      final finalScore = widget.game.calculateScore(_answers);
      widget.onComplete(finalScore);
      return;
    }
    setState(() {
      _index += 1;
      _locked = false;
      _selectedTrue = null;
      // Actualizar score parcial para mostrar en UI
      _score = widget.game.calculateScore(_answers);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
      child: ReviewGameScaffold(
        header: _buildHeader(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildCard(),
            const SizedBox(height: 24),
            _buildChoiceButton(
              label: 'Verdadero',
              icon: Icons.check_circle,
              value: true,
            ),
            const SizedBox(height: 12),
            _buildChoiceButton(
              label: 'Falso',
              icon: Icons.cancel,
              value: false,
            ),
            const SizedBox(height: 12),
          ],
        ),
        footer: ScoreFooter(
          score: _score,
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return ReviewHeaderRow(
      title: 'Pregunta ${_index + 1} / $_total',
      score: _score,
    );
  }

  Widget _buildChoiceButton({
    required String label,
    required IconData icon,
    required bool value,
  }) {
    final color = _buttonColor(value);
    final foreground = _buttonForeground(value);
    return IconTextButton(
      label: label,
      icon: icon,
      onTap: _locked ? null : () => _answer(value),
      backgroundColor: color,
      foregroundColor: foreground,
      minHeight: 52,
      expand: true,
    );
  }

  Color _buttonColor(bool value) {
    if (!_locked) {
      return AppColors.cardBackground;
    }
    // Usar la validación del modelo para determinar respuesta correcta
    final answer = {_index: value};
    final isCorrect = widget.game.validateAnswer(answer);
    
    if (isCorrect) {
      return AppColors.primaryGreen;
    }
    if (_selectedTrue == value) {
      return AppColors.errorRed;
    }
    return AppColors.cardBackground;
  }

  Color _buttonForeground(bool value) {
    if (!_locked) {
      return AppColors.textPrimary;
    }
    // Usar la validación del modelo para determinar respuesta correcta
    final answer = {_index: value};
    final isCorrect = widget.game.validateAnswer(answer);
    
    if (isCorrect) {
      return Colors.white;
    }
    if (_selectedTrue == value) {
      return Colors.white;
    }
    return AppColors.textPrimary;
  }

  Widget _buildCard() {
    return BilingualTextCard(
      textEn: _item.statement,
      textEs: _item.statementEs,
      enStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
      ),
      esStyle: const TextStyle(
        color: AppColors.textSecondary,
      ),
      padding: const EdgeInsets.all(20),
      borderRadius: 16,
    );
  }
}
