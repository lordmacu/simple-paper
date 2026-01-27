import 'package:flutter/material.dart';
import '../../../../domain/models/episode/episode.dart';
import '../../../../core/constants/app_colors.dart';

/// Estado del episodio
enum EpisodeStatus {
  locked,    // Bloqueado (no se puede acceder)
  unlocked,  // Desbloqueado (se puede jugar)
  completed, // Completado (ya se jugó)
}

class EpisodeItem extends StatefulWidget {
  final Episode episode;
  final VoidCallback? onTap;
  final EpisodeStatus status;
  final int starsEarned; // 0-3 estrellas

  const EpisodeItem({
    super.key,
    required this.episode,
    this.onTap,
    this.status = EpisodeStatus.unlocked,
    this.starsEarned = 0,
  });

  @override
  State<EpisodeItem> createState() => _EpisodeItemState();
}

class _EpisodeItemState extends State<EpisodeItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Color _getCardColor() {
    switch (widget.status) {
      case EpisodeStatus.locked:
        return Colors.grey.shade200;
      case EpisodeStatus.completed:
        return Colors.white;
      case EpisodeStatus.unlocked:
        return Colors.white;
    }
  }

  Color _getShadowColor() {
    switch (widget.status) {
      case EpisodeStatus.locked:
        return Colors.grey.shade400;
      case EpisodeStatus.completed:
        return AppColors.successGreen;
      case EpisodeStatus.unlocked:
        return AppColors.primaryGreen;
    }
  }

  Color _getCircleColor() {
    switch (widget.status) {
      case EpisodeStatus.locked:
        return Colors.grey.shade400;
      case EpisodeStatus.completed:
        return AppColors.successGreen;
      case EpisodeStatus.unlocked:
        return AppColors.primaryGreen;
    }
  }

  IconData _getStatusIcon() {
    switch (widget.status) {
      case EpisodeStatus.locked:
        return Icons.lock_rounded;
      case EpisodeStatus.completed:
        return Icons.check_circle_rounded;
      case EpisodeStatus.unlocked:
        return Icons.play_circle_filled_rounded;
    }
  }

  Color _getStatusIconColor() {
    switch (widget.status) {
      case EpisodeStatus.locked:
        return Colors.grey.shade600;
      case EpisodeStatus.completed:
        return AppColors.successGreen;
      case EpisodeStatus.unlocked:
        return AppColors.primaryGreen;
    }
  }

  void _handleTap() {
    if (widget.status == EpisodeStatus.locked) return;
    
    _animationController.forward().then((_) {
      _animationController.reverse();
    });
    
    widget.onTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: _getCardColor(),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: const Offset(0, 4),
              blurRadius: 0,
            ),
            BoxShadow(
              color: _getShadowColor(),
              offset: const Offset(0, 4),
              blurRadius: 0,
            ),
          ],
          border: Border.all(color: AppColors.divider, width: 2),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: _handleTap,
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  // Episode Number Circle
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: _getCircleColor(),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: const Offset(0, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        '${widget.episode.episodeMetadata.episodeNumber}',
                        style: TextStyle(
                          color: widget.status == EpisodeStatus.locked
                              ? Colors.grey.shade700
                              : Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),

                  // Title and Progress
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Episode ${widget.episode.episodeMetadata.episodeNumber}',
                          style: TextStyle(
                            color: widget.status == EpisodeStatus.locked
                                ? Colors.grey.shade600
                                : AppColors.textSecondary,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.episode.episodeMetadata.title,
                          style: TextStyle(
                            color: widget.status == EpisodeStatus.locked
                                ? Colors.grey.shade700
                                : AppColors.textPrimary,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        // Progress indicator (stars)
                        if (widget.status == EpisodeStatus.completed ||
                            widget.starsEarned > 0) ...[
                          const SizedBox(height: 6),
                          Row(
                            children: List.generate(
                              3,
                              (index) => Padding(
                                padding: const EdgeInsets.only(right: 4),
                                child: Icon(
                                  index < widget.starsEarned
                                      ? Icons.star_rounded
                                      : Icons.star_outline_rounded,
                                  color: index < widget.starsEarned
                                      ? AppColors.warningOrange
                                      : Colors.grey.shade400,
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),

                  // Status Icon (Locked/Unlocked/Completed)
                  Icon(
                    _getStatusIcon(),
                    color: _getStatusIconColor(),
                    size: 28,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
