import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

/// Overlay con efecto glass que muestra traducciones
/// Se desliza desde abajo con animación
class TranslationOverlay extends StatefulWidget {
  final String title;
  final String content;
  final VoidCallback onClose;
  final bool isQuote;

  const TranslationOverlay({
    Key? key,
    required this.title,
    required this.content,
    required this.onClose,
    this.isQuote = false,
  }) : super(key: key);

  @override
  State<TranslationOverlay> createState() => _TranslationOverlayState();
}

class _TranslationOverlayState extends State<TranslationOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1), // Empieza abajo
      end: Offset.zero, // Termina en posición
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    // Iniciar animación
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _handleClose() async {
    await _controller.reverse();
    widget.onClose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Backdrop con efecto glass (detrás de todo)
        GestureDetector(
          onTap: _handleClose,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
              child: Container(
                color: Colors.black.withOpacity(0.15),
              ),
            ),
          ),
        ),

        // Overlay content (encima del backdrop)
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: SlideTransition(
            position: _slideAnimation,
            child: GestureDetector(
              onTap: () {}, // Prevenir que el tap cierre el overlay
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
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
                                color: AppColors.textSecondary.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),

                            // Header con título y botón X
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 16, 12, 12),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.translate,
                                    color: AppColors.secondaryBlue,
                                    size: 22,
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      widget.title,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.textPrimary,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.close),
                                    color: AppColors.textSecondary,
                                    onPressed: _handleClose,
                                    style: IconButton.styleFrom(
                                      backgroundColor: AppColors.textSecondary.withOpacity(0.1),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Divider
                            Container(
                              height: 1,
                              margin: const EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.transparent,
                                    AppColors.textSecondary.withOpacity(0.2),
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
                                    fontStyle: widget.isQuote ? FontStyle.italic : FontStyle.normal,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 8),
                          ],
                        ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
