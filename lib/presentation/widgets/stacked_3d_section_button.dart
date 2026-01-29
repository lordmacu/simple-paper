import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/constants/app_colors.dart';
import 'stacked_3d_button.dart';

class Stacked3DSectionButton extends StatefulWidget {
  final String? label;
  final VoidCallback onTap;
  final Color topColor;
  final bool isEnabled;
  final IconData? icon;
  final double iconSize;
  final double width;
  final double height;
  final double pressDepth;
  final Duration pressDuration;
  final Duration actionDelay;

  const Stacked3DSectionButton({
    super.key,
    this.label,
    required this.onTap,
    required this.topColor,
    this.isEnabled = true,
    this.icon,
    this.iconSize = 28,
    this.width = 84,
    this.height = 88,
    this.pressDepth = 10,
    this.pressDuration = const Duration(milliseconds: 180),
    this.actionDelay = const Duration(milliseconds: 300),
  });

  @override
  State<Stacked3DSectionButton> createState() => _Stacked3DSectionButtonState();
}

class _Stacked3DSectionButtonState extends State<Stacked3DSectionButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pressController;
  late final Animation<double> _pressOffset;
  bool _didBottomHaptic = false;
  bool _didAction = false;

  @override
  void initState() {
    super.initState();
    _pressController = AnimationController(
      duration: widget.pressDuration,
      vsync: this,
    );
    _pressOffset = Tween<double>(begin: 0, end: widget.pressDepth).animate(
      CurvedAnimation(
        parent: _pressController,
        curve: Curves.easeInOutCubic,
      ),
    );
  }

  @override
  void dispose() {
    _pressController.dispose();
    super.dispose();
  }

  Future<void> _performActionOnce() async {
    if (_didAction) return;
    _didAction = true;
    await Future.delayed(widget.actionDelay);
    if (mounted) {
      widget.onTap();
    }
  }

  void _handleTapDown(TapDownDetails _) {
    HapticFeedback.lightImpact();
    _didBottomHaptic = false;
    _didAction = false;
    _pressController.forward().then((_) {
      if (mounted) {
        if (!_didBottomHaptic) {
          _didBottomHaptic = true;
          HapticFeedback.mediumImpact();
        }
        _performActionOnce();
      }
    });
  }

  Future<void> _handleTapUp(TapUpDetails _) async {
    if (_pressController.status != AnimationStatus.completed) {
      await _pressController.forward();
      if (!_didBottomHaptic) {
        _didBottomHaptic = true;
        HapticFeedback.mediumImpact();
      }
      _performActionOnce();
    }
    await _pressController.reverse();
  }

  void _handleTapCancel() {
    _pressController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final hasLabel = (widget.label ?? '').trim().isNotEmpty;
    final labelColor =
        widget.isEnabled ? AppColors.textPrimary : AppColors.textSecondary;
    return GestureDetector(
      onTapDown: widget.isEnabled ? _handleTapDown : null,
      onTapUp: widget.isEnabled ? _handleTapUp : null,
      onTapCancel: widget.isEnabled ? _handleTapCancel : null,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedBuilder(
            animation: _pressOffset,
            builder: (context, _) {
              return Stacked3DButton(
                pressOffset: _pressOffset.value,
                topColor: widget.topColor,
                width: widget.width,
                height: widget.height,
                isEnabled: widget.isEnabled,
                icon: widget.icon,
                iconSize: widget.iconSize,
              );
            },
          ),
          if (hasLabel) ...[
            const SizedBox(height: 6),
            SizedBox(
              width: 140,
              height: 36,
              child: Text(
                widget.label!,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: labelColor,
                  fontSize: 13,
                  height: 1.1,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
