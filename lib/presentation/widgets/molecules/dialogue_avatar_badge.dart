import 'package:flutter/material.dart';
import 'package:office_app/core/constants/app_colors.dart';

/// Badge circular con avatar de personaje.
///
/// Muestra imagen de avatar o un ícono de respaldo con animación.
class DialogueAvatarBadge extends StatelessWidget {
  /// Nombre del personaje para el ícono de respaldo.
  final String displayName;

  /// Ruta del asset del avatar.
  final String avatarAsset;

  /// Si está cargando el avatar.
  final bool isLoading;

  /// Si existe una URL de avatar disponible.
  final bool hasAvatarHint;

  /// Ícono a mostrar si no hay avatar.
  final IconData fallbackIcon;

  /// Tamaño del badge.
  final double size;

  /// Crea un [DialogueAvatarBadge].
  const DialogueAvatarBadge({
    required this.displayName,
    required this.avatarAsset,
    required this.isLoading,
    required this.hasAvatarHint,
    required this.fallbackIcon,
    super.key,
    this.size = 48,
  });

  @override
  Widget build(BuildContext context) {
    final child = avatarAsset.isNotEmpty
        ? ClipOval(
            key: ValueKey<String>(avatarAsset),
            child: SizedBox(
              width: size,
              height: size,
              child: Image.asset(
                avatarAsset,
                fit: BoxFit.cover,
                gaplessPlayback: true,
              ),
            ),
          )
        : (isLoading || hasAvatarHint
            ? SizedBox(
                key: const ValueKey<String>('avatar_placeholder'),
                width: size,
                height: size,
              )
            : Container(
                key: ValueKey<String>('icon_$displayName'),
                width: size,
                height: size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primaryGreen.withValues(alpha: 0.3),
                      AppColors.secondaryBlue.withValues(alpha: 0.3),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Icon(
                  fallbackIcon,
                  color: AppColors.textPrimary,
                  size: size * 0.5,
                ),
              ));

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 260),
      switchInCurve: Curves.easeOut,
      switchOutCurve: Curves.easeIn,
      transitionBuilder: (child, animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: child,
    );
  }
}
