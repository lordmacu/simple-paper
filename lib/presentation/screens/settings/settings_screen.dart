import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_colors.dart';
import '../../providers/personalization_providers.dart';
import '../../providers/template_variable_provider.dart';
import '../../../data/services/template_variable_service.dart';
import 'city_selection_screen.dart';
import 'office_customization_screen.dart';
import 'character_management_screen.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

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
    final service = ref.watch(templateVariableServiceProvider);
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
            const Text(
              'Tu nombre',
              style: TextStyle(
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
            ElevatedButton.icon(
              icon: const Icon(Icons.save),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryGreen,
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onPressed: _saveName,
              label: const Text(
                'Guardar',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Velocidad de voz (TTS)',
              style: TextStyle(
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
            const Text(
              'Ciudad de tu oficina',
              style: TextStyle(
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
            const Text(
              'Oficina',
              style: TextStyle(
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
            const Text(
              'Personajes',
              style: TextStyle(
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
      if (value == null) return;
      final parsed = double.tryParse(value);
      if (parsed == null) return;
      if (!mounted) return;
      setState(() => _ttsRate = parsed);
    } catch (_) {
      // ignore
    }
  }

  // Reset removido por requerimiento
}

class _CityCard extends ConsumerWidget {
  final VoidCallback onTap;
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
                  Text(
                    'Ciudad actual',
                    style: const TextStyle(
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

class _OfficeCard extends ConsumerWidget {
  final VoidCallback onTap;
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
                  Text(
                    'Compañía y tipo',
                    style: const TextStyle(
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

class _CharactersCard extends StatelessWidget {
  final VoidCallback onTap;
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
        child: Row(
          children: [
            const Icon(Icons.people_alt, color: AppColors.secondaryBlue),
            const SizedBox(width: 12),
            const Expanded(
              child: Text(
                'Renombrar personajes',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const Icon(Icons.chevron_right, color: AppColors.textSecondary),
          ],
        ),
      ),
    );
  }
}
