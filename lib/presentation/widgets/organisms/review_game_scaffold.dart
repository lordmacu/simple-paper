import 'package:flutter/material.dart';

/// Scaffold base para pantallas de juegos de revisión.
///
/// Estructura con header, body y footer opcional con soporte de scroll.
class ReviewGameScaffold extends StatelessWidget {
  /// Widget del encabezado.
  final Widget header;

  /// Widget del cuerpo principal.
  final Widget body;

  /// Widget del pie opcional.
  final Widget? footer;

  /// Padding del contenido.
  final EdgeInsetsGeometry padding;

  /// Si el contenido es scrollable.
  final bool scrollable;

  /// Color de fondo.
  final Color backgroundColor;

  /// Crea un [ReviewGameScaffold].
  const ReviewGameScaffold({
    required this.header,
    required this.body,
    super.key,
    this.footer,
    this.padding = const EdgeInsets.all(20),
    this.scrollable = false,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        header,
        const SizedBox(height: 16),
        body,
        if (footer != null) ...[
          const SizedBox(height: 12),
          footer!,
        ],
      ],
    );

    return Container(
      color: backgroundColor,
      padding: padding,
      child: scrollable
          ? SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: content,
            )
          : content,
    );
  }
}
