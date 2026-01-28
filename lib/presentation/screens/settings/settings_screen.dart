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

  @override
  void initState() {
    super.initState();
    final current =
        ref.read(templateVariableServiceProvider).getVariable('player_name');
    _nameController = TextEditingController(text: current);
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
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: AppColors.textSecondary),
            tooltip: 'Reset a valores por defecto',
            onPressed: () => _showResetDialog(context, service),
          ),
        ],
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
            const Text(
              'Reset rápido',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 18,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              icon: const Icon(Icons.restore),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondaryBlue,
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onPressed: () => _resetAll(service),
              label: const Text(
                'Resetear personalización',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
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
      Navigator.of(context).pop();
    }
  }

  Future<void> _resetAll(TemplateVariableService service) async {
    await service.resetToDefaults();
    ref.read(playerNameProvider.notifier).state =
        service.getVariable('player_name');
    final repo = ref.read(personalizationRepositoryProvider);
    await repo.saveVariables(service.getAllVariables());
    if (mounted) {
      setState(() {
        _nameController.text = service.getVariable('player_name');
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Personalización reseteada')),
      );
    }
  }

  void _showResetDialog(BuildContext context, TemplateVariableService service) {
    showDialog<void>(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Resetear personalización'),
        content: const Text(
          'Se restaurarán nombre, ciudad, compañía, tipo de oficina y renombres de personajes a los valores por defecto.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.errorRed),
            onPressed: () async {
              Navigator.pop(context);
              await _resetAll(service);
            },
            child: const Text('Resetear'),
          ),
        ],
      ),
    );
  }
}

class _CityCard extends ConsumerWidget {
  final VoidCallback onTap;
  const _CityCard({required this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final service = ref.watch(templateVariableServiceProvider);
    final city = service.getVariable('city');
    final company = service.getVariable('company_name');
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
    final service = ref.watch(templateVariableServiceProvider);
    final company = service.getVariable('company_name');
    final type = service.getVariable('office_type');
    final city = service.getVariable('city');
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
