import 'package:flutter/material.dart';
import 'package:office_app/core/constants/app_colors.dart';

/// Card con pregunta y campo de entrada interactivo.
///
/// Muestra pregunta bilingüe con campo de texto para respuesta.
class InteractiveInputCard extends StatelessWidget {
  /// Pregunta en inglés.
  final String question;

  /// Pregunta en español.
  final String questionEs;

  /// Controlador del campo de texto.
  final TextEditingController controller;

  /// Texto de placeholder.
  final String? hintText;

  /// Si el campo tiene autofocus.
  final bool autofocus;

  /// Acción del teclado.
  final TextInputAction textInputAction;

  /// Callback cuando se envía el texto.
  final void Function(String value)? onSubmitted;

  /// Color de fondo del card.
  final Color backgroundColor;

  /// Color del borde.
  final Color borderColor;

  /// Crea un [InteractiveInputCard].
  const InteractiveInputCard({
    required this.question,
    required this.questionEs,
    required this.controller,
    super.key,
    this.hintText,
    this.autofocus = false,
    this.textInputAction = TextInputAction.done,
    this.onSubmitted,
    this.backgroundColor = const Color(0x1A1CB0F6),
    this.borderColor = const Color(0x4D1CB0F6),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            questionEs,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: controller,
            autofocus: autofocus,
            textInputAction: textInputAction,
            decoration: InputDecoration(
              hintText: hintText ?? 'Type here...',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: AppColors.secondaryBlue,
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: AppColors.secondaryBlue,
                  width: 2,
                ),
              ),
            ),
            style: const TextStyle(fontSize: 16),
            onSubmitted: onSubmitted,
          ),
        ],
      ),
    );
  }
}
