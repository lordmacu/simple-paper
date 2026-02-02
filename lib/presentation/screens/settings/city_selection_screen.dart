import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_colors.dart';
import '../../providers/personalization_providers.dart';
import '../../widgets/atoms/primary_button.dart';
import '../../widgets/molecules/section_header.dart';
import '../../providers/template_variable_provider.dart';

/// city selection screen/widget
class CitySelectionScreen extends ConsumerStatefulWidget {
  /// Crea una instancia de city selection screen.
  const CitySelectionScreen({super.key});

  @override
  ConsumerState<CitySelectionScreen> createState() =>
      _CitySelectionScreenState();
}

class _CitySelectionScreenState extends ConsumerState<CitySelectionScreen> {
  final List<String> _cities = const [
    'Scranton',
    'Nueva York',
    'Londres',
    'Tokyo',
    'Madrid',
    'Toronto',
    'Ciudad de México',
    'Buenos Aires',
  ];

  String? _selected;
  String? _error;

  @override
  void initState() {
    super.initState();
    _selected = ref.read(cityProvider);
  }

  @override
  Widget build(BuildContext context) {
    final company = ref.watch(companyNameProvider);
    final preview = '$company ${_selected ?? ''}';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Selecciona tu ciudad',
          style: TextStyle(color: AppColors.textPrimary),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeader(
              title: 'Ciudades sugeridas',
              padding: EdgeInsets.zero,
              titleStyle: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 16,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _cities.map((city) {
                final isSelected = _selected == city;
                return ChoiceChip(
                  label: Text(city),
                  selected: isSelected,
                  onSelected: (_) => setState(() {
                    _selected = city;
                  }),
                  selectedColor: AppColors.primaryGreen.withValues(alpha: 0.15),
                  labelStyle: TextStyle(
                    color: isSelected
                        ? AppColors.primaryGreen
                        : AppColors.textPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            const SectionHeader(
              title: 'Ciudad personalizada',
              padding: EdgeInsets.zero,
              titleStyle: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 16,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: 'Escribe otra ciudad',
                errorText: _error,
                filled: true,
                fillColor: AppColors.cardBackground,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _error = null;
                  _selected = value.trim();
                });
              },
            ),
            const SizedBox(height: 20),
            const SectionHeader(
              title: 'Preview',
              padding: EdgeInsets.zero,
              titleStyle: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 16,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Text(
                preview,
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            const Spacer(),
            PrimaryButton(
              text: 'Guardar ciudad',
              onPressed: _save,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _save() async {
    final city = _selected?.trim() ?? '';
    if (city.isEmpty) {
      setState(() => _error = 'Ingresa o elige una ciudad');
      return;
    }
    final setCity = ref.read(setCityProvider);
    await setCity(city);
    if (mounted) {
      Navigator.of(context).pop();
    }
  }
}
