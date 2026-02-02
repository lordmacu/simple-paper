import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_colors.dart';
import '../../../domain/models/story/scene.dart';
import '../../providers/template_variable_provider.dart';
import '../atoms/primary_button.dart';

/// Pantalla de transición entre escenas.
///
/// Muestra la ubicación y tiempo antes de empezar los diálogos.
class SceneTransition extends ConsumerStatefulWidget {
  /// Datos de la escena actual.
  final Scene scene;

  /// Callback cuando el usuario continúa.
  final VoidCallback onContinue;

  /// Crea un [SceneTransition].
  const SceneTransition({
    required this.scene,
    required this.onContinue,
    super.key,
  });

  @override
  ConsumerState<SceneTransition> createState() => _SceneTransitionState();
}

class _SceneTransitionState extends ConsumerState<SceneTransition>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _controller.forward();
  }

  void _setupAnimations() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.6, curve: Curves.easeIn),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 1.0, curve: Curves.easeOutBack),
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 1.0, curve: Curves.easeOutCubic),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final template = ref.read(templateVariableServiceProvider);
    final location = template.replaceVariables(widget.scene.location);
    final locationEs = template.replaceVariables(widget.scene.locationEs);
    final time = template.replaceVariables(widget.scene.time);
    final description = template.replaceVariables(widget.scene.description);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primaryGreen.withValues(alpha: 0.1),
            AppColors.secondaryBlue.withValues(alpha: 0.1),
          ],
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            // Header con número de escena
            Padding(
              padding: const EdgeInsets.all(24),
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primaryGreen.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Escena ${widget.scene.sceneNumber}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryGreen,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Contenido principal
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Icono de ubicación
                      ScaleTransition(
                        scale: _scaleAnimation,
                        child: FadeTransition(
                          opacity: _fadeAnimation,
                          child: Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.primaryGreen.withValues(alpha: 0.3),
                                  AppColors.secondaryBlue.withValues(alpha: 0.3),
                                ],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.primaryGreen.withValues(alpha: 0.3),
                                  blurRadius: 20,
                                  spreadRadius: 5,
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.location_on,
                              size: 60,
                              color: AppColors.primaryGreen,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 40),

                      // Ubicación
                      SlideTransition(
                        position: _slideAnimation,
                        child: FadeTransition(
                          opacity: _fadeAnimation,
                          child: Column(
                            children: [
                              Text(
                                location,
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textPrimary,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                locationEs,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: AppColors.textSecondary,
                                  fontStyle: FontStyle.italic,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Tiempo
                      FadeTransition(
                        opacity: _fadeAnimation,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.secondaryBlue.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: AppColors.secondaryBlue.withValues(alpha: 0.3),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.access_time,
                                size: 18,
                                color: AppColors.secondaryBlue,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                time,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: AppColors.secondaryBlue,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Descripción (si existe)
                      if (description.isNotEmpty) ...[
                        const SizedBox(height: 32),
                        FadeTransition(
                          opacity: _fadeAnimation,
                          child: Text(
                            description,
                            style: const TextStyle(
                              fontSize: 15,
                              color: AppColors.textSecondary,
                              height: 1.5,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),

            // Botón Continue
            Padding(
              padding: const EdgeInsets.all(24),
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: SizedBox(
                  width: double.infinity,
                  child: PrimaryButton(
                    text: 'Comenzar Escena',
                    icon: Icons.arrow_forward,
                    onPressed: widget.onContinue,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
