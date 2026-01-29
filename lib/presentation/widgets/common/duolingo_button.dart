import 'package:flutter/material.dart';
import 'package:office_app/core/constants/app_colors.dart';
import 'package:office_app/core/utils/haptic_utils.dart';

/// Botón Continue estilo Duolingo
/// Con animación de escala al presionar y diseño vibrante
class DuolingoButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isSecondary;
  final IconData? icon;

  const DuolingoButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isSecondary = false,
    this.icon,
  });

  @override
  State<DuolingoButton> createState() => _DuolingoButtonState();
}

class _DuolingoButtonState extends State<DuolingoButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }

  void _onTapCancel() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final bool isEnabled = widget.onPressed != null;

    return GestureDetector(
      onTapDown: isEnabled ? _onTapDown : null,
      onTapUp: isEnabled ? _onTapUp : null,
      onTapCancel: isEnabled ? _onTapCancel : null,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          child: widget.isSecondary ? _buildSecondaryButton() : _buildPrimaryButton(),
        ),
      ),
    );
  }

  Widget _buildPrimaryButton() {
    final bool isEnabled = widget.onPressed != null;

    return ElevatedButton(
      onPressed: HapticUtils.wrap(widget.onPressed),
      style: ElevatedButton.styleFrom(
        backgroundColor: isEnabled
            ? AppColors.primaryGreen
            : AppColors.textSecondary.withOpacity(0.3),
        foregroundColor: Colors.white,
        disabledBackgroundColor: AppColors.textSecondary.withOpacity(0.3),
        disabledForegroundColor: Colors.white.withOpacity(0.5),
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: isEnabled ? 6 : 2,
        shadowColor: isEnabled
            ? AppColors.primaryGreen.withOpacity(0.4)
            : Colors.black.withOpacity(0.1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            widget.text,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          if (widget.icon != null) ...[
            const SizedBox(width: 8),
            Icon(widget.icon, size: 20),
          ],
        ],
      ),
    );
  }

  Widget _buildSecondaryButton() {
    final bool isEnabled = widget.onPressed != null;

    return OutlinedButton(
      onPressed: HapticUtils.wrap(widget.onPressed),
      style: OutlinedButton.styleFrom(
        foregroundColor: isEnabled ? AppColors.textPrimary : AppColors.textSecondary,
        disabledForegroundColor: AppColors.textSecondary.withOpacity(0.5),
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        side: BorderSide(
          color: isEnabled
              ? AppColors.textPrimary.withOpacity(0.3)
              : AppColors.textSecondary.withOpacity(0.2),
          width: 2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          if (widget.icon != null) ...[
            Icon(widget.icon, size: 20),
            const SizedBox(width: 8),
          ],
          Text(
            widget.text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    );
  }
}
