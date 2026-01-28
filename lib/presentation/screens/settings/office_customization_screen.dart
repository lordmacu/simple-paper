import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_colors.dart';
import '../../providers/personalization_providers.dart';
import '../../providers/template_variable_provider.dart';

class OfficeCustomizationScreen extends ConsumerStatefulWidget {
  const OfficeCustomizationScreen({super.key});

  @override
  ConsumerState<OfficeCustomizationScreen> createState() =>
      _OfficeCustomizationScreenState();
}

class _OfficeCustomizationScreenState
    extends ConsumerState<OfficeCustomizationScreen> {
  late final TextEditingController _companyController;
  late final TextEditingController _typeController;
  String? _errorCompany;
  String? _errorType;

  @override
  void initState() {
    super.initState();
    final service = ref.read(templateVariableServiceProvider);
    _companyController =
        TextEditingController(text: service.getVariable('company_name'));
    _typeController =
        TextEditingController(text: service.getVariable('office_type'));
  }

  @override
  void dispose() {
    _companyController.dispose();
    _typeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final service = ref.watch(templateVariableServiceProvider);
    final city = service.getVariable('city');

    final preview =
        '${_companyController.text.trim().isEmpty ? service.getVariable('company_name') : _companyController.text.trim()} '
        '${_typeController.text.trim().isEmpty ? service.getVariable('office_type') : _typeController.text.trim()} · $city';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Personaliza tu oficina',
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
            const Text(
              'Nombre de la compañía',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 16,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _companyController,
              maxLength: 30,
              decoration: InputDecoration(
                counterText: '',
                hintText: 'Ej: Dunder Mifflin',
                errorText: _errorCompany,
                filled: true,
                fillColor: AppColors.cardBackground,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Tipo de oficina',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 16,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _typeController,
              maxLength: 30,
              decoration: InputDecoration(
                counterText: '',
                hintText: 'Ej: Compañía de Papel',
                errorText: _errorType,
                filled: true,
                fillColor: AppColors.cardBackground,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Preview',
              style: TextStyle(
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
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryGreen,
                minimumSize: const Size(double.infinity, 52),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onPressed: _save,
              child: const Text(
                'Guardar',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _save() async {
    final name = _companyController.text.trim();
    final type = _typeController.text.trim();
    setState(() {
      _errorCompany = name.isEmpty ? 'El nombre no puede estar vacío' : null;
      _errorType = type.isEmpty ? 'El tipo no puede estar vacío' : null;
    });
    if (_errorCompany != null || _errorType != null) return;

    final setCompany = ref.read(setCompanyNameProvider);
    final setType = ref.read(setOfficeTypeProvider);
    await setCompany(name);
    await setType(type);
    if (mounted) Navigator.of(context).pop();
  }
}
