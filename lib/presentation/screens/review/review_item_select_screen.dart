import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../data/sources/content_db.dart';
import '../../widgets/common/duolingo_button.dart';
import 'review_game_play_screen.dart';
import 'review_types.dart';

class ReviewItemSelectScreen extends StatefulWidget {
  final ReviewCategory category;
  final ReviewGameType gameType;

  const ReviewItemSelectScreen({
    super.key,
    required this.category,
    required this.gameType,
  });

  @override
  State<ReviewItemSelectScreen> createState() => _ReviewItemSelectScreenState();
}

class _ReviewItemSelectScreenState extends State<ReviewItemSelectScreen> {
  final ContentDb _db = ContentDb();
  bool _loading = true;
  String? _error;
  List<Map<String, String>> _complexItems = [];
  List<String> _simpleItems = [];
  late Set<String> _selectedKeys;

  @override
  void initState() {
    super.initState();
    _selectedKeys = <String>{};
    _loadItems();
  }

  Future<void> _loadItems({bool preserveSelection = false}) async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      switch (widget.category.type) {
        case ReviewCategoryType.irregularVerbs:
          _complexItems = await _db.fetchIrregularVerbsAll();
          _simpleItems = [];
          _selectedKeys = _resolveSelection(
            preserveSelection,
            _complexItems.map((item) => item['base']!).toSet(),
          );
          break;
        case ReviewCategoryType.countries:
          _complexItems = await _db.fetchCountriesAll();
          _simpleItems = [];
          _selectedKeys = _resolveSelection(
            preserveSelection,
            _complexItems.map((item) => item['country']!).toSet(),
          );
          break;
        case ReviewCategoryType.comparatives:
          _complexItems = await _db.fetchComparativesAll();
          _simpleItems = [];
          _selectedKeys = _resolveSelection(
            preserveSelection,
            _complexItems.map((item) => item['base']!).toSet(),
          );
          break;
        case ReviewCategoryType.cities:
          _simpleItems = await _db.fetchCitiesAll();
          _complexItems = [];
          _selectedKeys = _resolveSelection(
            preserveSelection,
            _simpleItems.toSet(),
          );
          break;
      }
    } catch (e) {
      _error = e.toString();
    } finally {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  Set<String> _resolveSelection(bool preserve, Set<String> allKeys) {
    if (!preserve) return allKeys;
    final kept = _selectedKeys.intersection(allKeys);
    final newlyAdded = allKeys.difference(_selectedKeys);
    return {...kept, ...newlyAdded};
  }

  void _toggleKey(String key, bool checked) {
    setState(() {
      if (checked) {
        _selectedKeys.add(key);
      } else {
        _selectedKeys.remove(key);
      }
    });
  }

  Future<void> _deleteItem(String key) async {
    switch (widget.category.type) {
      case ReviewCategoryType.irregularVerbs:
        await _db.deleteIrregularVerb(key);
        _complexItems
            .removeWhere((item) => item['base'] == key);
        break;
      case ReviewCategoryType.countries:
        await _db.deleteCountry(key);
        _complexItems
            .removeWhere((item) => item['country'] == key);
        break;
      case ReviewCategoryType.comparatives:
        await _db.deleteComparative(key);
        _complexItems
            .removeWhere((item) => item['base'] == key);
        break;
      case ReviewCategoryType.cities:
        await _db.deleteCity(key);
        _simpleItems.removeWhere((item) => item == key);
        break;
    }
    setState(() {
      _selectedKeys.remove(key);
    });
  }

  void _startGame() {
    final minRequired = _minRequired(widget.gameType);
    if (_selectedKeys.length < minRequired) {
      setState(() {
        _error =
            'Selecciona al menos $minRequired items para este minijuego.';
      });
      return;
    }

    final selectedComplex = _complexItems
        .where((item) => _selectedKeys.contains(_keyFor(item)))
        .toList();
    final selectedSimple =
        _simpleItems.where((item) => _selectedKeys.contains(item)).toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ReviewGamePlayScreen(
          category: widget.category,
          gameType: widget.gameType,
          irregularVerbs: widget.category.type == ReviewCategoryType.irregularVerbs
              ? selectedComplex
              : null,
          countries: widget.category.type == ReviewCategoryType.countries
              ? selectedComplex
              : null,
          comparatives: widget.category.type == ReviewCategoryType.comparatives
              ? selectedComplex
              : null,
          cities: widget.category.type == ReviewCategoryType.cities
              ? selectedSimple
              : null,
        ),
      ),
    );
  }

  int _minRequired(ReviewGameType gameType) {
    switch (gameType) {
      case ReviewGameType.bingo:
        return 6;
      case ReviewGameType.matching:
        return 5;
      case ReviewGameType.memory:
        return 2;
      case ReviewGameType.multipleChoice:
        return 4;
      case ReviewGameType.orderForms:
      case ReviewGameType.typing:
      case ReviewGameType.flashcard:
      case ReviewGameType.fillBlank:
      case ReviewGameType.trueFalse:
        return 1;
    }
  }

  String _keyFor(Map<String, String> item) {
    switch (widget.category.type) {
      case ReviewCategoryType.irregularVerbs:
        return item['base']!;
      case ReviewCategoryType.countries:
        return item['country']!;
      case ReviewCategoryType.comparatives:
        return item['base']!;
      case ReviewCategoryType.cities:
        return '';
    }
  }

  String _titleFor(Map<String, String> item) {
    switch (widget.category.type) {
      case ReviewCategoryType.irregularVerbs:
        return '${item['base']} — ${item['past']} — ${item['past_participle']}';
      case ReviewCategoryType.countries:
        return '${item['country']} — ${item['nationality']} — ${item['language']}';
      case ReviewCategoryType.comparatives:
        return '${item['base']} — ${item['comparative']} — ${item['superlative']}';
      case ReviewCategoryType.cities:
        return '';
    }
  }

  Future<void> _showAddDialog() async {
    switch (widget.category.type) {
      case ReviewCategoryType.irregularVerbs:
        await _showAddIrregularDialog();
        break;
      case ReviewCategoryType.countries:
        await _showAddCountryDialog();
        break;
      case ReviewCategoryType.comparatives:
        await _showAddComparativeDialog();
        break;
      case ReviewCategoryType.cities:
        await _showAddCityDialog();
        break;
    }
  }

  Future<void> _showAddIrregularDialog() async {
    final base = TextEditingController();
    final past = TextEditingController();
    final participle = TextEditingController();
    final saved = await _showFormDialog(
      title: 'Agregar verbo',
      fields: [
        _DialogField(label: 'Base', controller: base),
        _DialogField(label: 'Past', controller: past),
        _DialogField(label: 'Past participle', controller: participle),
      ],
    );
    if (!saved) return;
    await _db.addIrregularVerb(
      base: base.text.trim(),
      past: past.text.trim(),
      pastParticiple: participle.text.trim(),
    );
    await _loadItems(preserveSelection: true);
  }

  Future<void> _showAddCountryDialog() async {
    final country = TextEditingController();
    final nationality = TextEditingController();
    final language = TextEditingController();
    final saved = await _showFormDialog(
      title: 'Agregar país',
      fields: [
        _DialogField(label: 'Country', controller: country),
        _DialogField(label: 'Nationality', controller: nationality),
        _DialogField(label: 'Language', controller: language),
      ],
    );
    if (!saved) return;
    await _db.addCountry(
      country: country.text.trim(),
      nationality: nationality.text.trim(),
      language: language.text.trim(),
    );
    await _loadItems(preserveSelection: true);
  }

  Future<void> _showAddComparativeDialog() async {
    final base = TextEditingController();
    final comparative = TextEditingController();
    final superlative = TextEditingController();
    final saved = await _showFormDialog(
      title: 'Agregar comparativo',
      fields: [
        _DialogField(label: 'Base', controller: base),
        _DialogField(label: 'Comparative', controller: comparative),
        _DialogField(label: 'Superlative', controller: superlative),
      ],
    );
    if (!saved) return;
    await _db.addComparative(
      base: base.text.trim(),
      comparative: comparative.text.trim(),
      superlative: superlative.text.trim(),
    );
    await _loadItems(preserveSelection: true);
  }

  Future<void> _showAddCityDialog() async {
    final city = TextEditingController();
    final saved = await _showFormDialog(
      title: 'Agregar ciudad',
      fields: [
        _DialogField(label: 'City', controller: city),
      ],
    );
    if (!saved) return;
    await _db.addCity(city.text.trim());
    await _loadItems(preserveSelection: true);
  }

  Future<bool> _showFormDialog({
    required String title,
    required List<_DialogField> fields,
  }) async {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: Column(
              children: fields
                  .map(
                    (field) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: TextField(
                        controller: field.controller,
                        decoration: InputDecoration(
                          labelText: field.label,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                final invalid = fields.any(
                  (field) => field.controller.text.trim().isEmpty,
                );
                if (invalid) return;
                Navigator.of(context).pop(true);
              },
              child: const Text('Guardar'),
            ),
          ],
        );
      },
    ).then((value) => value ?? false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Selecciona para ${widget.category.title}',
          style: const TextStyle(color: AppColors.textPrimary),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: _showAddDialog,
          ),
        ],
      ),
      body: _loading
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryGreen,
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Seleccionadas: ${_selectedKeys.length}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  OutlinedButton.icon(
                    onPressed: _toggleSelectAll,
                    icon: Icon(
                      _allSelected() ? Icons.remove_done : Icons.select_all,
                    ),
                    label: Text(
                      _allSelected()
                          ? 'Deseleccionar todo'
                          : 'Seleccionar todo',
                    ),
                  ),
                  if (_error != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      _error!,
                      style: const TextStyle(
                        color: AppColors.errorRed,
                      ),
                    ),
                  ],
                  const SizedBox(height: 12),
                  Expanded(child: _buildList()),
                  const SizedBox(height: 12),
                  DuolingoButton(
                    text: 'Iniciar minijuego',
                    onPressed: _selectedKeys.isEmpty ? null : _startGame,
                    icon: Icons.play_arrow,
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildList() {
    if (_simpleItems.isNotEmpty) {
      return ListView.builder(
        itemCount: _simpleItems.length,
        itemBuilder: (context, index) {
          final item = _simpleItems[index];
          final checked = _selectedKeys.contains(item);
          return _SelectableTile(
            title: item,
            checked: checked,
            onChanged: (value) => _toggleKey(item, value),
            onDelete: () => _deleteItem(item),
          );
        },
      );
    }

    return ListView.builder(
      itemCount: _complexItems.length,
      itemBuilder: (context, index) {
        final item = _complexItems[index];
        final key = _keyFor(item);
        final checked = _selectedKeys.contains(key);
        return _SelectableTile(
          title: _titleFor(item),
          checked: checked,
          onChanged: (value) => _toggleKey(key, value),
          onDelete: () => _deleteItem(key),
        );
      },
    );
  }

  void _toggleSelectAll() {
    if (_allSelected()) {
      _clearAll();
    } else {
      _selectAll();
    }
  }

  void _selectAll() {
    setState(() {
      _selectedKeys = _allKeys().toSet();
      _error = null;
    });
  }

  void _clearAll() {
    setState(() {
      _selectedKeys.clear();
      _error = null;
    });
  }

  Iterable<String> _allKeys() {
    if (_simpleItems.isNotEmpty) return _simpleItems;
    return _complexItems.map(_keyFor);
  }

  bool _allSelected() {
    final all = _allKeys().toSet();
    return all.isNotEmpty && _selectedKeys.length == all.length;
  }
}

class _SelectableTile extends StatelessWidget {
  final String title;
  final bool checked;
  final ValueChanged<bool> onChanged;
  final VoidCallback onDelete;

  const _SelectableTile({
    required this.title,
    required this.checked,
    required this.onChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Checkbox(
            value: checked,
            onChanged: (value) => onChanged(value ?? false),
            activeColor: AppColors.primaryGreen,
          ),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline, color: AppColors.errorRed),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}

class _DialogField {
  final String label;
  final TextEditingController controller;

  const _DialogField({
    required this.label,
    required this.controller,
  });
}
