import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

/// Repositorio sencillo para persistir variables de personalización
/// (player_name, city, company_name, office_type, etc.) en SharedPreferences.
class PersonalizationRepository {
  static const _key = 'personalization_vars';
  final SharedPreferences _prefs;

  PersonalizationRepository(this._prefs);

  Future<Map<String, String>> loadVariables() async {
    final raw = _prefs.getString(_key);
    if (raw == null) return {};
    try {
      final decoded = jsonDecode(raw) as Map<String, dynamic>;
      return decoded.map((k, v) => MapEntry(k, v.toString()));
    } catch (_) {
      return {};
    }
  }

  Future<void> saveVariables(Map<String, String> vars) async {
    await _prefs.setString(_key, jsonEncode(vars));
  }

  Future<void> setVariable(String key, String value) async {
    final current = await loadVariables();
    current[key] = value;
    await saveVariables(current);
  }
}
