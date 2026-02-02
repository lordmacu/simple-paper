import 'package:flutter/material.dart';
import 'package:office_app/core/constants/app_colors.dart';

/// Etiqueta con el nombre del personaje.
///
/// Muestra el nombre con alineación configurable.
class CharacterNameLabel extends StatelessWidget {
  /// Nombre del personaje.
  final String name;

  /// Si se alinea a la derecha.
  final bool alignRight;

  /// Padding externo.
  final EdgeInsetsGeometry padding;

  /// Estilo de texto personalizado.
  final TextStyle? style;

  /// Crea un [CharacterNameLabel].
  const CharacterNameLabel({
    required this.name,
    super.key,
    this.alignRight = false,
    this.padding = EdgeInsets.zero,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Align(
        alignment: alignRight ? Alignment.centerRight : Alignment.centerLeft,
        child: Text(
          name,
          style: style ??
              const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.textSecondary,
              ),
          textAlign: alignRight ? TextAlign.right : TextAlign.left,
        ),
      ),
    );
  }
}
