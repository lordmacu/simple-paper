import 'package:flutter/material.dart';
import 'package:office_app/core/constants/app_colors.dart';

/// Fila de título para diálogos con ícono y botón de cerrar.
///
/// Muestra un título con ícono opcional y botón X para cerrar.
class DialogTitleRow extends StatelessWidget {
  /// Título a mostrar.
  final String title;

  /// Ícono opcional antes del título.
  final IconData? leadingIcon;

  /// Color del ícono.
  final Color leadingColor;

  /// Callback cuando se cierra el diálogo.
  final VoidCallback? onClose;

  /// Padding externo.
  final EdgeInsetsGeometry padding;

  /// Crea un [DialogTitleRow].
  const DialogTitleRow({
    required this.title,
    super.key,
    this.leadingIcon,
    this.leadingColor = AppColors.secondaryBlue,
    this.onClose,
    this.padding = const EdgeInsets.fromLTRB(20, 16, 12, 12),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: [
          if (leadingIcon != null) ...[
            Icon(
              leadingIcon,
              color: leadingColor,
              size: 22,
            ),
            const SizedBox(width: 10),
          ],
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          if (onClose != null)
            IconButton(
              icon: const Icon(Icons.close),
              color: AppColors.textSecondary,
              onPressed: onClose,
              style: IconButton.styleFrom(
                backgroundColor: AppColors.textSecondary.withValues(alpha: 0.1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
