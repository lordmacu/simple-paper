import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_colors.dart';
import '../../providers/character_providers.dart';
import '../../providers/personalization_providers.dart';
import '../../providers/template_variable_provider.dart';
import '../../../domain/models/character/unlocked_character.dart';

class CharacterManagementScreen extends ConsumerWidget {
  const CharacterManagementScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unlockedAsync = ref.watch(unlockedCharactersProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Personajes',
          style: TextStyle(color: AppColors.textPrimary),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
      ),
      body: unlockedAsync.when(
        data: (unlocked) => _CharacterList(unlocked: unlocked),
        loading: () =>
            const Center(child: CircularProgressIndicator(color: AppColors.primaryGreen)),
        error: (err, _) => Center(
          child: Text(
            'Error: $err',
            style: const TextStyle(color: AppColors.errorRed),
          ),
        ),
      ),
    );
  }
}

class _CharacterList extends ConsumerWidget {
  final List<UnlockedCharacter> unlocked;
  const _CharacterList({required this.unlocked});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unlockedIds = unlocked.map((c) => c.characterId).toSet();
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _allCharacters.length,
      itemBuilder: (context, index) {
        final c = _allCharacters[index];
        final isUnlocked = unlockedIds.contains(c.id);
        final unlockedChar =
            unlocked.firstWhere((u) => u.characterId == c.id, orElse: () => UnlockedCharacter(
              characterId: c.id,
              defaultName: c.defaultName,
              customName: null,
              unlockedAt: 0,
              episodeNumber: 0,
            ));
        final displayName = unlockedChar.customName ?? c.defaultName;
        return Card(
          color: isUnlocked ? Colors.white : AppColors.cardBackground,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor:
                  isUnlocked ? AppColors.primaryGreen.withOpacity(0.15) : Colors.grey.shade300,
              child: Icon(
                isUnlocked ? Icons.person : Icons.lock,
                color: isUnlocked ? AppColors.primaryGreen : Colors.grey,
              ),
            ),
            title: Text(
              displayName,
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: isUnlocked ? AppColors.textPrimary : Colors.grey,
              ),
            ),
            subtitle: Text(
              c.role,
              style: TextStyle(
                color: isUnlocked ? AppColors.textSecondary : Colors.grey,
              ),
            ),
            trailing: isUnlocked
                ? TextButton(
                    onPressed: () => _openRenameDialog(context, ref, c.id, c.defaultName, displayName),
                    child: const Text('Renombrar'),
                  )
                : const SizedBox.shrink(),
          ),
        );
      },
    );
  }

  void _openRenameDialog(
    BuildContext context,
    WidgetRef ref,
    String characterId,
    String defaultName,
    String currentName,
  ) {
    final controller = TextEditingController(text: currentName);
    String? error;
    showDialog(
      context: context,
      builder: (ctx) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            title: const Text('Renombrar personaje'),
            content: TextField(
              controller: controller,
              maxLength: 20,
              decoration: InputDecoration(
                counterText: '',
                errorText: error,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancelar'),
              ),
              TextButton(
                onPressed: () async {
                  final newName = controller.text.trim();
                  if (newName.isEmpty) {
                    setState(() => error = 'No puede estar vacío');
                    return;
                  }
                  if (newName.length > 20) {
                    setState(() => error = 'Máximo 20 caracteres');
                    return;
                  }
                  final rename = ref.read(renameCharacterProvider);
                  await rename(
                    characterId: characterId,
                    defaultName: defaultName,
                    newName: newName,
                  );
                  ref.invalidate(unlockedCharactersProvider);
                  // actualizar variables de template inmediatas
                  final key = _templateKeyForCharacterLocal(characterId);
                  if (key != null) {
                    ref.read(templateVariableServiceProvider).updateVariable(key, newName);
                  }
                  if (context.mounted) Navigator.of(context).pop();
                },
                child: const Text('Guardar'),
              ),
              TextButton(
                onPressed: () async {
                  final rename = ref.read(renameCharacterProvider);
                  await rename(
                    characterId: characterId,
                    defaultName: defaultName,
                    newName: defaultName,
                  );
                  ref.invalidate(unlockedCharactersProvider);
                  final key = _templateKeyForCharacterLocal(characterId);
                  if (key != null) {
                    ref.read(templateVariableServiceProvider).updateVariable(key, defaultName);
                  }
                  if (context.mounted) Navigator.of(context).pop();
                },
                child: const Text('Reset'),
              ),
            ],
          );
        });
      },
    );
  }
}

class _CharacterInfo {
  final String id;
  final String defaultName;
  final String role;
  const _CharacterInfo({required this.id, required this.defaultName, required this.role});
}

const _allCharacters = <_CharacterInfo>[
  _CharacterInfo(id: 'char_boss', defaultName: 'Michael', role: 'Jefe'),
  _CharacterInfo(id: 'char_jim', defaultName: 'Jim', role: 'Ventas'),
  _CharacterInfo(id: 'char_pam', defaultName: 'Pam', role: 'Recepción'),
  _CharacterInfo(id: 'char_dwight', defaultName: 'Dwight', role: 'Ventas'),
  _CharacterInfo(id: 'char_stanley', defaultName: 'Stanley', role: 'Ventas'),
  _CharacterInfo(id: 'char_angela', defaultName: 'Angela', role: 'Contabilidad'),
  _CharacterInfo(id: 'char_kevin', defaultName: 'Kevin', role: 'Contabilidad'),
  _CharacterInfo(id: 'char_ryan', defaultName: 'Ryan', role: 'Pasante'),
  _CharacterInfo(id: 'char_andy', defaultName: 'Andy', role: 'Ventas'),
  _CharacterInfo(id: 'char_oscar', defaultName: 'Oscar', role: 'Contabilidad'),
  _CharacterInfo(id: 'char_meredith', defaultName: 'Meredith', role: 'Compras'),
  _CharacterInfo(id: 'char_phyllis', defaultName: 'Phyllis', role: 'Ventas'),
  _CharacterInfo(id: 'char_toby', defaultName: 'Toby', role: 'RRHH'),
  _CharacterInfo(id: 'char_creed', defaultName: 'Creed', role: 'Calidad'),
];

String? _templateKeyForCharacterLocal(String characterId) {
  switch (characterId) {
    case 'char_boss':
      return 'boss_name';
    case 'char_jim':
      return 'jim_name';
    case 'char_pam':
      return 'pam_name';
    case 'char_dwight':
      return 'dwight_name';
    default:
      return null;
  }
}
