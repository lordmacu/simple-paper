import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../molecules/dialog_title_row.dart';
import '../molecules/modal_overlay_base.dart';

/// Overlay deslizante que muestra traducciones.
///
/// Se desliza desde abajo con animación y muestra contenido traducido.
class TranslationOverlay extends StatefulWidget {
  /// Título del overlay.
  final String title;

  /// Contenido de la traducción.
  final String content;

  /// Callback cuando se cierra el overlay.
  final VoidCallback onClose;

  /// Si es `true`, muestra el contenido en cursiva.
  final bool isQuote;

  /// Crea un [TranslationOverlay].
  const TranslationOverlay({
    required this.title,
    required this.content,
    required this.onClose,
    super.key,
    this.isQuote = false,
  });

  @override
  State<TranslationOverlay> createState() => _TranslationOverlayState();
}

class _TranslationOverlayState extends State<TranslationOverlay> {
  @override
  Widget build(BuildContext context) {
    return BaseModalOverlay(
      onClose: widget.onClose,
      alignment: Alignment.bottomCenter,
      slideFrom: const Offset(0, 1),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 20,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Drag handle
              Container(
                margin: const EdgeInsets.only(top: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.textSecondary.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              // Header con título y botón X
              DialogTitleRow(
                title: widget.title,
                leadingIcon: Icons.translate,
                onClose: widget.onClose,
              ),

              // Divider
              Container(
                height: 1,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      AppColors.textSecondary.withValues(alpha: 0.2),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),

              // Contenido de traducción
              Container(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.5,
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  physics: const BouncingScrollPhysics(),
                  child: Text(
                    widget.content,
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.6,
                      color: AppColors.textPrimary,
                      fontStyle:
                          widget.isQuote ? FontStyle.italic : FontStyle.normal,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 8),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
