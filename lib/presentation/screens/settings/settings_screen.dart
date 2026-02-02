import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_colors.dart';
import '../../providers/personalization_providers.dart';
import '../../providers/template_variable_provider.dart';
import 'city_selection_screen.dart';
import 'office_customization_screen.dart';
import 'character_management_screen.dart';
import '../../widgets/atoms/primary_button.dart';
import '../../widgets/molecules/section_header.dart';


/// Pantalla de configuración y personalización de la app.
/// Permite cambiar nombre, ciudad, oficina, personajes y velocidad de voz.
class SettingsScreen extends ConsumerStatefulWidget {
  /// Crea la pantalla de configuración principal.
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

/// Estado de [SettingsScreen]. Maneja lógica de nombre, TTS y navegación.
class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  late final TextEditingController _nameController;
  String? _error;
  double _ttsRate = 0.35;

  @override
  void initState() {
    super.initState();
    final current =
        ref.read(templateVariableServiceProvider).getVariable('player_name');
    _nameController = TextEditingController(text: current);
    Future.microtask(_loadTtsRate);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(templateVariableServiceProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Personalización',
            style: TextStyle(color: AppColors.textPrimary)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
        actions: const [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const SectionHeader(
              title: 'Tu nombre',
              padding: EdgeInsets.zero,
              titleStyle: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 18,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _nameController,
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
            const SizedBox(height: 12),
            PrimaryButton(
              text: 'Guardar',
              icon: Icons.save,
              onPressed: _saveName,
            ),
            const SizedBox(height: 24),
            const SectionHeader(
              title: 'Velocidad de voz (TTS)',
              padding: EdgeInsets.zero,
              titleStyle: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 18,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Velocidad: ${(_ttsRate * 100).round()}%',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Slider(
                    value: _ttsRate,
                    min: 0.2,
                    max: 0.8,
                    divisions: 6,
                    label: (_ttsRate * 100).round().toString(),
                    onChanged: (value) async {
                      setState(() => _ttsRate = value);
                      await ref.read(setTtsRateProvider)(value);
                    },
                  ),
                  const Text(
                    'Más bajo = más lento',
                    style: TextStyle(color: AppColors.textSecondary),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const SectionHeader(
              title: 'Ciudad de tu oficina',
              padding: EdgeInsets.zero,
              titleStyle: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 18,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            _CityCard(onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const CitySelectionScreen()),
              );
            }),
            const SizedBox(height: 24),
            const SectionHeader(
              title: 'Oficina',
              padding: EdgeInsets.zero,
              titleStyle: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 18,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            _OfficeCard(onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const OfficeCustomizationScreen()),
              );
            }),
            const SizedBox(height: 24),
            const SectionHeader(
              title: 'Personajes',
              padding: EdgeInsets.zero,
              titleStyle: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 18,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            _CharactersCard(onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const CharacterManagementScreen()),
              );
            }),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Future<void> _saveName() async {
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      setState(() => _error = 'El nombre no puede estar vacío');
      return;
    }
    if (name.length > 20) {
      setState(() => _error = 'Máximo 20 caracteres');
      return;
    }
    setState(() => _error = null);

    final setPlayerName = ref.read(setPlayerNameProvider);
    await setPlayerName(name);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nombre actualizado')),
      );
    }
  }

  Future<void> _loadTtsRate() async {
    try {
      final repo = ref.read(personalizationRepositoryProvider);
      final saved = await repo.loadVariables();
      final value = saved['tts_rate'];
      if (value == null) {
        return;
      }
      final parsed = double.tryParse(value);
      if (parsed == null) {
        return;
      }
      if (!mounted) {
        return;
      }
      setState(() => _ttsRate = parsed);
    } on Exception catch (_) {
      // ignore
    }
  }

  // Reset removido por requerimiento
}


/// Card para mostrar y cambiar la ciudad de la oficina.
class _CityCard extends ConsumerWidget {
  /// Callback al tocar la card.
  final VoidCallback onTap;
  /// Crea el widget de ciudad.
  const _CityCard({required this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final city = ref.watch(cityProvider);
    final company = ref.watch(companyNameProvider);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            const Icon(Icons.location_city, color: AppColors.secondaryBlue),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Ciudad actual',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$city · $company $city',
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: AppColors.textSecondary),
          ],
        ),
      ),
    );
  }
}


/// Card para mostrar y cambiar la oficina y tipo de compañía.
class _OfficeCard extends ConsumerWidget {
  /// Callback al tocar la card.
  final VoidCallback onTap;
  /// Crea el widget de oficina.
  const _OfficeCard({required this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final company = ref.watch(companyNameProvider);
    final type = ref.watch(officeTypeProvider);
    final city = ref.watch(cityProvider);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            const Icon(Icons.business_center, color: AppColors.primaryGreen),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Compañía y tipo',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$company · $type · $city',
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: AppColors.textSecondary),
          ],
        ),
      ),
    );
  }
}


/// Card para acceder a la gestión y renombrado de personajes.
class _CharactersCard extends StatelessWidget {
  /// Callback al tocar la card.
  final VoidCallback onTap;
  /// Crea el widget de personajes.
  const _CharactersCard({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(14),
        ),
        child: const Row(
          children: [
            Icon(Icons.people_alt, color: AppColors.secondaryBlue),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                'Renombrar personajes',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Icon(Icons.chevron_right, color: AppColors.textSecondary),
          ],
        ),
      ),
    );
  }
}
