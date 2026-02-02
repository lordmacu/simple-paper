import 'dart:ui';
import 'package:flutter/material.dart';

/// Overlay modal base con animación y blur.
///
/// Proporciona un fondo borroso con contenido animado.
class BaseModalOverlay extends StatefulWidget {
  /// Contenido del modal.
  final Widget child;

  /// Callback cuando se cierra el modal.
  final VoidCallback onClose;

  /// Alineación del contenido.
  final Alignment alignment;

  /// Si se puede cerrar tocando el fondo.
  final bool barrierDismissible;

  /// Si aplica efecto blur al fondo.
  final bool blurBackground;

  /// Intensidad del blur.
  final double blurSigma;

  /// Color de la barrera.
  final Color barrierColor;

  /// Duración de la animación.
  final Duration duration;

  /// Curva de la animación.
  final Curve curve;

  /// Offset inicial del slide.
  final Offset slideFrom;

  /// Crea un [BaseModalOverlay].
  const BaseModalOverlay({
    required this.child,
    required this.onClose,
    super.key,
    this.alignment = Alignment.bottomCenter,
    this.barrierDismissible = true,
    this.blurBackground = true,
    this.blurSigma = 8,
    this.barrierColor = const Color(0x26000000),
    this.duration = const Duration(milliseconds: 250),
    this.curve = Curves.easeOutBack,
    this.slideFrom = const Offset(0, 1),
  });

  @override
  State<BaseModalOverlay> createState() => _BaseModalOverlayState();
}

class _BaseModalOverlayState extends State<BaseModalOverlay>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this);
    _slideAnimation = Tween<Offset>(
      begin: widget.slideFrom,
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: widget.curve));
    _fadeAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _handleClose() async {
    await _controller.reverse();
    if (mounted) {
      widget.onClose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: widget.barrierDismissible ? _handleClose : null,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: widget.blurBackground
                ? BackdropFilter(
                    filter: ImageFilter.blur(
                        sigmaX: widget.blurSigma, sigmaY: widget.blurSigma),
                    child: Container(color: widget.barrierColor),
                  )
                : Container(color: widget.barrierColor),
          ),
        ),
        Align(
          alignment: widget.alignment,
          child: SlideTransition(
            position: _slideAnimation,
            child: GestureDetector(
              onTap: () {},
              child: widget.child,
            ),
          ),
        ),
      ],
    );
  }
}
