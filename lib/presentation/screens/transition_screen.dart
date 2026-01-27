import 'package:flutter/material.dart';
import '../widgets/common/duolingo_button.dart';
import '../../core/constants/app_colors.dart';
import '../../domain/models/content_wrappers/content_wrappers.dart';

/// Pantalla de transición que se muestra entre Vocabulary Story y Main Story
/// Muestra texto motivacional bilingüe antes de continuar con las escenas
class TransitionScreen extends StatefulWidget {
  final BilingualText transitionText;
  final VoidCallback onContinue;

  const TransitionScreen({
    Key? key,
    required this.transitionText,
    required this.onContinue,
  }) : super(key: key);

  @override
  State<TransitionScreen> createState() => _TransitionScreenState();
}

class _TransitionScreenState extends State<TransitionScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCubic,
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: Column(
              children: [
                // Header con icono decorativo
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: _buildHeader(),
                ),

                // Contenido principal
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 40),
                        _buildTransitionCard(),
                        const SizedBox(height: 60),
                      ],
                    ),
                  ),
                ),

                // Botón Continue
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: DuolingoButton(
                    text: 'Continue to Story',
                    onPressed: widget.onContinue,
                    icon: Icons.arrow_forward,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        // Icono de estrella con animación
        TweenAnimationBuilder<double>(
          tween: Tween(begin: 0.0, end: 1.0),
          duration: const Duration(milliseconds: 1000),
          curve: Curves.elasticOut,
          builder: (context, value, child) {
            return Transform.scale(
              scale: value,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: AppColors.primaryGreen.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.star_rounded,
                  size: 48,
                  color: AppColors.primaryGreen,
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 16),
        
        // Título
        Text(
          'Great Job!',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        
        // Subtítulo
        Text(
          'You learned the vocabulary',
          style: TextStyle(
            fontSize: 16,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildTransitionCard() {
    return AnimatedBuilder(
      animation: _fadeAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: _fadeAnimation.value,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 16,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Texto en inglés
                _buildTextSection(
                  language: 'English',
                  text: widget.transitionText.en,
                  icon: Icons.translate,
                  color: AppColors.secondaryBlue,
                ),
                
                const SizedBox(height: 24),
                
                // Divider decorativo
                Container(
                  height: 1,
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
                
                const SizedBox(height: 24),
                
                // Texto en español
                _buildTextSection(
                  language: 'Español',
                  text: widget.transitionText.es,
                  icon: Icons.translate,
                  color: AppColors.warningOrange,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextSection({
    required String language,
    required String text,
    required IconData icon,
    required Color color,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Language label
        Row(
          children: [
            Icon(
              icon,
              size: 16,
              color: color,
            ),
            const SizedBox(width: 8),
            Text(
              language,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: color,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        
        // Transition text
        Text(
          text,
          style: TextStyle(
            fontSize: 18,
            height: 1.6,
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
