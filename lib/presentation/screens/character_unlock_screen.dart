import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/common/duolingo_button.dart';
import '../widgets/common/translation_overlay.dart';
import '../../core/constants/app_colors.dart';
import '../../domain/models/episode/character.dart';
import '../widgets/character/rename_character_dialog.dart';
import '../providers/template_variable_provider.dart';
import '../providers/character_providers.dart';
import 'package:confetti/confetti.dart';

/// Pantalla de celebración cuando se desbloquea un nuevo personaje
/// Muestra información del personaje con animaciones estilo Duolingo
class CharacterUnlockScreen extends ConsumerStatefulWidget {
  final Character character;
  final VoidCallback onContinue;

  const CharacterUnlockScreen({
    Key? key,
    required this.character,
    required this.onContinue,
  }) : super(key: key);

  @override
  ConsumerState<CharacterUnlockScreen> createState() =>
      _CharacterUnlockScreenState();
}

class _CharacterUnlockScreenState extends ConsumerState<CharacterUnlockScreen>
    with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late ConfettiController _confettiController;

  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  
  String? _customName; // Nombre personalizado del usuario
  String? _showingTranslation; // 'personality' o 'intro' o null

  @override
  void initState() {
    super.initState();

    // Scale animation para el avatar
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _scaleAnimation = CurvedAnimation(
      parent: _scaleController,
      curve: Curves.elasticOut,
    );

    // Fade animation para el contenido
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    );

    // Slide animation para el texto
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOutCubic,
    ));

    // Confetti controller
    _confettiController = ConfettiController(
      duration: const Duration(seconds: 3),
    );

    // Iniciar animaciones en secuencia
    Future.delayed(const Duration(milliseconds: 100), () {
      _confettiController.play();
      _scaleController.forward();
    });

    Future.delayed(const Duration(milliseconds: 400), () {
      _fadeController.forward();
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      _slideController.forward();
    });

    // Si es el jugador, mostrar automáticamente el diálogo de renombrar
    if (_isPlayer() && widget.character.customizableName) {
      Future.delayed(const Duration(milliseconds: 1500), () {
        if (mounted) {
          _showRenameDialog();
        }
      });
    }
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _fadeController.dispose();
    _slideController.dispose();
    _confettiController.dispose();
    super.dispose();
  }

  void _showRenameDialog() {
    showDialog(
      context: context,
      builder: (context) => RenameCharacterDialog(
        characterId: widget.character.characterId,
        defaultName: widget.character.defaultName,
        currentName: _customName ?? widget.character.defaultName,
        onSave: (newName) async {
          setState(() {
            _customName = newName;
          });
          
          // Guardar en template variables
          final templateService = ref.read(templateVariableServiceProvider);
          final variableKey = _getTemplateVariableKey(widget.character.characterId);
          templateService.updateVariable(variableKey, newName);
          
          // Guardar en el repositorio de personajes
          final repository = ref.read(characterRepositoryProvider);
          await repository.updateCharacterName(
            widget.character.characterId,
            newName,
          );
          
          // Mostrar confirmación
          if (!mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('¡Personaje renombrado a "$newName"!'),
              backgroundColor: AppColors.primaryGreen,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        },
      ),
    );
  }

  /// Detecta si el personaje es el jugador
  bool _isPlayer() {
    return widget.character.characterId == 'char_player';
  }

  /// Obtiene la clave de template variable según el character_id
  String _getTemplateVariableKey(String characterId) {
    final Map<String, String> characterVariables = {
      'char_player': 'player_name',
      'char_boss': 'boss_name',
      'char_jim': 'jim_name',
      'char_pam': 'pam_name',
      'char_dwight': 'dwight_name',
      'char_stanley': 'stanley_name',
      'char_angela': 'angela_name',
      'char_kevin': 'kevin_name',
      'char_ryan': 'ryan_name',
      'char_andy': 'andy_name',
      'char_oscar': 'oscar_name',
      'char_meredith': 'meredith_name',
      'char_phyllis': 'phyllis_name',
      'char_toby': 'toby_name',
      'char_creed': 'creed_name',
    };
    
    return characterVariables[characterId] ?? 'unknown_name';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Contenido principal
          SafeArea(
            child: Column(
              children: [
                // Header con botón de cerrar
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.close),
                        color: AppColors.textSecondary,
                        onPressed: widget.onContinue,
                      ),
                    ],
                  ),
                ),

                // Contenido principal
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 8),

                        // Título dinámico según tipo de personaje
                        FadeTransition(
                          opacity: _fadeAnimation,
                          child: Column(
                            children: [
                              Text(
                                _isPlayer() ? '¡Bienvenido al Equipo!' : '¡Nuevo Personaje!',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryGreen,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              // Texto explicativo para el jugador
                              if (_isPlayer()) ...[
                                const SizedBox(height: 8),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 32),
                                  child: Text(
                                    'Esta es tu credencial de empleado. ¡Ahora eres parte del equipo!',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: AppColors.textSecondary,
                                      height: 1.4,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Información del personaje
                        SlideTransition(
                          position: _slideAnimation,
                          child: FadeTransition(
                            opacity: _fadeAnimation,
                            child: _buildCharacterInfo(),
                          ),
                        ),

                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),

                // Botones de acción
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: Column(
                      children: [
                        // Botón Rename (si el personaje es personalizable)
                        if (widget.character.customizableName) ...[
                          DuolingoButton(
                            text: 'Renombrar Personaje',
                            onPressed: _showRenameDialog,
                            isSecondary: true,
                            icon: Icons.edit,
                          ),
                          const SizedBox(height: 12),
                        ],
                        
                        // Botón Continue
                        DuolingoButton(
                          text: 'Continuar',
                          onPressed: widget.onContinue,
                          icon: Icons.arrow_forward,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Confetti overlay
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirection: 3.14 / 2, // hacia abajo
              emissionFrequency: 0.05,
              numberOfParticles: 20,
              gravity: 0.3,
              colors: const [
                AppColors.primaryGreen,
                AppColors.secondaryBlue,
                AppColors.warningOrange,
                Colors.purple,
                Colors.pink,
              ],
            ),
          ),

          // Translation overlay
          if (_showingTranslation != null)
            TranslationOverlay(
              title: _showingTranslation == 'personality' 
                ? 'Personalidad (Español)'
                : _showingTranslation == 'role'
                  ? 'Cargo (Español)'
                  : 'Introducción (Español)',
              content: _showingTranslation == 'personality'
                ? (widget.character.personalityEs ?? '')
                : _showingTranslation == 'role'
                  ? (widget.character.roleEs ?? '')
                  : (widget.character.introTextEs != null
                      ? ref.read(templateVariableServiceProvider).replaceVariables(widget.character.introTextEs!)
                      : ''),
              isQuote: _showingTranslation == 'intro',
              onClose: () {
                setState(() {
                  _showingTranslation = null;
                });
              },
            ),
        ],
      ),
    );
  }

  Widget _buildCharacterAvatar() {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primaryGreen.withOpacity(0.2),
            AppColors.secondaryBlue.withOpacity(0.2),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryGreen.withOpacity(0.3),
            blurRadius: 30,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Center(
        child: Container(
          width: 180,
          height: 180,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(
              color: AppColors.primaryGreen,
              width: 4,
            ),
          ),
          child: Center(
            child: _getCharacterIcon(widget.character.defaultName),
          ),
        ),
      ),
    );
  }

  Widget _buildCharacterInfo() {
    return Container(
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
          // Avatar y nombre del personaje en fila
          Row(
            children: [
              // Avatar pequeño
              ScaleTransition(
                scale: _scaleAnimation,
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColors.primaryGreen.withOpacity(0.2),
                        AppColors.secondaryBlue.withOpacity(0.2),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryGreen.withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(
                          color: AppColors.primaryGreen,
                          width: 3,
                        ),
                      ),
                      child: Center(
                        child: _getCharacterIcon(widget.character.defaultName),
                      ),
                    ),
                  ),
                ),
              ),
              
              const SizedBox(width: 16),
              
              // Nombre y rol
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _customName ?? widget.character.defaultName,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    // Rol (clickeable para ver traducción)
                    InkWell(
                      onTap: () {
                        setState(() {
                          _showingTranslation = _showingTranslation == 'role' ? null : 'role';
                        });
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.secondaryBlue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                widget.character.role,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: AppColors.secondaryBlue,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 2,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Padding(
                              padding: const EdgeInsets.only(top: 2),
                              child: Icon(
                                Icons.translate,
                                size: 12,
                                color: AppColors.secondaryBlue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Divider
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

          // Personalidad
          _buildInfoSection(
            icon: Icons.psychology,
            title: 'Personalidad',
            content: widget.character.personality,
            translationEs: widget.character.personalityEs,
            onTap: () {
              setState(() {
                _showingTranslation = _showingTranslation == 'personality' ? null : 'personality';
              });
            },
          ),

          const SizedBox(height: 20),

          // Intro text (con template variables aplicadas)
          if (widget.character.introText != null) ...[
            _buildInfoSection(
              icon: Icons.chat_bubble_outline,
              title: 'Introducción',
              content: ref.read(templateVariableServiceProvider).replaceVariables(widget.character.introText!),
              translationEs: widget.character.introTextEs != null 
                ? ref.read(templateVariableServiceProvider).replaceVariables(widget.character.introTextEs!)
                : null,
              isQuote: true,
              onTap: () {
                setState(() {
                  _showingTranslation = _showingTranslation == 'intro' ? null : 'intro';
                });
              },
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildInfoSection({
    required IconData icon,
    required String title,
    required String content,
    String? translationEs,
    bool isQuote = false,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: translationEs != null ? onTap : null,
      borderRadius: BorderRadius.circular(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 18,
                color: AppColors.primaryGreen,
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryGreen,
                  letterSpacing: 0.5,
                ),
              ),
              if (translationEs != null) ...[
                const SizedBox(width: 6),
                Icon(
                  Icons.translate,
                  size: 14,
                  color: AppColors.secondaryBlue,
                ),
              ],
            ],
          ),
          const SizedBox(height: 8),
          Container(
            padding: isQuote
                ? const EdgeInsets.all(12)
                : EdgeInsets.zero,
            decoration: isQuote
                ? BoxDecoration(
                    color: AppColors.primaryGreen.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppColors.primaryGreen.withOpacity(0.2),
                      width: 1,
                    ),
                  )
                : null,
            child: Text(
              content,
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
                color: AppColors.textPrimary,
                fontStyle: isQuote ? FontStyle.italic : FontStyle.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getCharacterIcon(String characterName) {
    // Iconos placeholder para cada personaje
    final Map<String, IconData> characterIcons = {
      'MICHAEL': Icons.business_center,
      'JIM': Icons.laptop_mac,
      'PAM': Icons.brush,
      'DWIGHT': Icons.agriculture,
      'STANLEY': Icons.coffee,
      'ANGELA': Icons.pets,
      'KEVIN': Icons.cake,
      'RYAN': Icons.school,
      'ANDY': Icons.music_note,
      'OSCAR': Icons.calculate,
      'MEREDITH': Icons.local_bar,
      'PHYLLIS': Icons.favorite,
      'TOBY': Icons.gavel,
      'CREED': Icons.music_note,
      'NEW EMPLOYEE': Icons.badge, // El jugador
      'PLAYER': Icons.badge, // Por si acaso queda alguno
    };

    final icon = characterIcons[characterName.toUpperCase()] ?? Icons.person;

    return Icon(
      icon,
      size: 40,
      color: AppColors.primaryGreen,
    );
  }
}
