import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_colors.dart';
import '../../providers/content_import_provider.dart';
import '../../providers/episode_providers.dart';
import '../../providers/personalization_providers.dart';
import '../../providers/template_variable_provider.dart';

class WelcomeNameScreen extends ConsumerStatefulWidget {
  const WelcomeNameScreen({super.key, required this.onFinished});

  final VoidCallback onFinished;

  @override
  ConsumerState<WelcomeNameScreen> createState() => _WelcomeNameScreenState();
}

class _WelcomeNameScreenState extends ConsumerState<WelcomeNameScreen> {
  late final TextEditingController _controller;
  String? _error;
  bool _isImporting = false;

  @override
  void initState() {
    super.initState();
    // Prefill with Camilo as requested
    _controller = TextEditingController(text: 'Camilo');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFe9f8e6), Color(0xFFf5fbff)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        // Card principal
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.06),
                                blurRadius: 12,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: const [
                                  Icon(Icons.emoji_people,
                                      color: AppColors.primaryGreen, size: 28),
                                  SizedBox(width: 8),
                                  Text(
                                    '¡Bienvenido!',
                                    style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w900,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Aquí aprenderás muchas palabras en inglés y conocerás personajes de The Office. Queremos saber cómo te llamas.',
                                style: TextStyle(
                                  fontSize: 16,
                                  height: 1.4,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                              const SizedBox(height: 16),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.asset(
                                  'assets/saludos.png',
                                  height: 160,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 18),
                              const Text(
                                'Tu nombre',
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              const SizedBox(height: 8),
                              TextField(
                                key: const Key('welcome_input_name'),
                                controller: _controller,
                                maxLength: 20,
                                decoration: InputDecoration(
                                  counterText: '',
                                  hintText: 'Ingresa tu nombre',
                                  errorText: _error,
                                  filled: true,
                                  fillColor: AppColors.cardBackground,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(14),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        ElevatedButton(
                          key: const Key('welcome_button_continue'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryGreen,
                            minimumSize: const Size(double.infinity, 52),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            elevation: 6,
                            shadowColor: AppColors.primaryGreen.withOpacity(0.35),
                          ),
                          onPressed: _isImporting ? null : _save,
                          child: _isImporting
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2.4,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white,
                                    ),
                                  ),
                                )
                              : const Text(
                                  'Continuar',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                        ),
                        TextButton(
                          key: const Key('welcome_button_skip'),
                          onPressed: null, // skip deshabilitado; requiere nombre
                          child: const Text(
                            'Debes ingresar un nombre para continuar',
                            style: TextStyle(color: AppColors.textSecondary),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> _save() async {
    final name = _controller.text.trim();
    if (name.isEmpty) {
      setState(() => _error = 'El nombre no puede estar vacío');
      return;
    }
    if (name.length > 20) {
      setState(() => _error = 'Máximo 20 caracteres');
      return;
    }
    setState(() {
      _error = null;
      _isImporting = true;
    });
    try {
      final setPlayerName = ref.read(setPlayerNameProvider);
      await setPlayerName(name);
      // Refrescar variable local del provider
      ref
          .read(templateVariableServiceProvider)
          .updateVariable('player_name', name);

      final importer = ref.read(contentImportServiceProvider);
      final result = await importer.importAll();

      if (!mounted) return;
      ref.invalidate(episodeListProvider);
      setState(() => _isImporting = false);
      widget.onFinished();
      if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop();
      }
    } catch (e) {
      if (!mounted) return;
      setState(() => _isImporting = false);
    }
  }
}
