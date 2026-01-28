import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_colors.dart';
import '../common/duolingo_button.dart';

/// Dialog para renombrar un personaje
/// Permite al usuario personalizar el nombre de un personaje desbloqueado
class RenameCharacterDialog extends ConsumerStatefulWidget {
  final String characterId;
  final String defaultName;
  final String currentName;
  final Function(String newName) onSave;

  const RenameCharacterDialog({
    Key? key,
    required this.characterId,
    required this.defaultName,
    required this.currentName,
    required this.onSave,
  }) : super(key: key);

  @override
  ConsumerState<RenameCharacterDialog> createState() =>
      _RenameCharacterDialogState();
}

class _RenameCharacterDialogState extends ConsumerState<RenameCharacterDialog>
    with SingleTickerProviderStateMixin {
  late TextEditingController _controller;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _isValid = true;
  String _errorMessage = '';

  bool get _isPlayer => widget.characterId == 'char_player';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.currentName);
    
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutBack,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _validateAndSave() {
    final name = _controller.text.trim();

    // Validación
    if (name.isEmpty) {
      setState(() {
        _isValid = false;
        _errorMessage = 'El nombre no puede estar vacío';
      });
      return;
    }

    if (name.length > 20) {
      setState(() {
        _isValid = false;
        _errorMessage = 'El nombre es muy largo (máximo 20 caracteres)';
      });
      return;
    }

    // Guardar y cerrar
    widget.onSave(name);
    Navigator.of(context).pop();
  }

  void _resetToDefault() {
    setState(() {
      _controller.text = widget.defaultName;
      _isValid = true;
      _errorMessage = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.zero,
        content: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              padding: const EdgeInsets.fromLTRB(24, 40, 24, 24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        _isPlayer ? '¡Hola! ¿Cómo te llamas?' : 'Renombrar Personaje',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _isPlayer 
                          ? 'Escribe tu nombre. Así te llamaremos en la oficina.'
                          : 'Este personaje se llama "${widget.defaultName}". ¿Quieres cambiarle el nombre?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),

              const SizedBox(height: 24),

              // Input field
              TextField(
                controller: _controller,
                autofocus: true,
                maxLength: 20,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textPrimary,
                ),
                decoration: InputDecoration(
                  labelText: _isPlayer ? 'Tu nombre' : 'Nuevo nombre',
                  hintText: _isPlayer ? 'Escribe tu nombre aquí' : 'Escribe el nombre del personaje',
                  errorText: _isValid ? null : _errorMessage,
                  filled: true,
                  fillColor: AppColors.cardBackground,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: AppColors.textSecondary.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: AppColors.primaryGreen,
                      width: 2,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: AppColors.errorRed,
                      width: 2,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.person,
                    color: AppColors.primaryGreen,
                  ),
                ),
                onChanged: (value) {
                  if (!_isValid) {
                    setState(() {
                      _isValid = true;
                      _errorMessage = '';
                    });
                  }
                },
                onSubmitted: (_) => _validateAndSave(),
              ),

              const SizedBox(height: 12),

              // Reset to default button (solo si no es el jugador)
              if (!_isPlayer) ...[
                TextButton.icon(
                  onPressed: _resetToDefault,
                  icon: Icon(
                    Icons.refresh,
                    size: 18,
                    color: AppColors.secondaryBlue,
                  ),
                  label: Text(
                    'Restaurar nombre original',
                    style: TextStyle(
                      color: AppColors.secondaryBlue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
              ],

              if (_isPlayer) const SizedBox(height: 24),

              // Action buttons
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: DuolingoButton(
                      text: 'Cancelar',
                      onPressed: () => Navigator.of(context).pop(),
                      isSecondary: true,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 4,
                    child: DuolingoButton(
                      text: _isPlayer ? 'OK' : 'Guardar',
                      onPressed: _validateAndSave,
                      icon: Icons.check,
                    ),
                  ),
                ],
              ),
            ],
          ),
            ),
            
            // Close button - floating top right
            Positioned(
              top: 8,
              right: 8,
              child: IconButton(
                icon: const Icon(Icons.close),
                color: AppColors.textSecondary,
                iconSize: 24,
                onPressed: () => Navigator.of(context).pop(),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
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
