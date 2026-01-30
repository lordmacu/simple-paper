/// Servicio para manejar y reemplazar variables dinámicas en los textos.
///
/// Permite personalizar la experiencia del usuario reemplazando
/// placeholders como {player_name}, {boss_name}, etc.
class TemplateVariableService {
  // Valores por defecto
  final Map<String, String> _defaults = {
    'player_name': 'New Hire',
    'boss_name': 'Leo',
    'jim_name': 'Ben',
    'pam_name': 'Mia',
    'dwight_name': 'Dan',
    'company_name': 'Simple Paper',
    'city': 'Aurora',
    'office_type': 'Paper Company',
  };

  Map<String, String> _currentValues = {};

  TemplateVariableService() {
    _resetToDefaults();
  }

  void _resetToDefaults() {
    _currentValues = Map.from(_defaults);
  }

  /// Reset público para restaurar defaults
  Future<void> resetToDefaults() async {
    _resetToDefaults();
  }

  /// Actualiza una variable específica
  void updateVariable(String key, String value) {
    if (_defaults.containsKey(key)) {
      _currentValues[key] = value;
    }
  }

  /// Reemplaza todas las variables en un texto dado
  String replaceVariables(String text) {
    if (text.isEmpty) return text;

    String result = text;
    // Iteramos sobre defaults para asegurar que cubrimos todas las claves conocidas
    // Usamos los valores actuales (o defaults si no se han seteaado)
    _defaults.forEach((key, defaultValue) {
      final value = _currentValues[key] ?? defaultValue;
      // 1. Reemplazo de placeholders {variable}
      result = result.replaceAll('{$key}', value);
      
      // 2. Si el valor actual es diferente al default, también reemplazamos
      //    el valor por defecto literal (para JSONs que tienen "Simple Paper" en lugar de {company_name})
      if (value != defaultValue && defaultValue.isNotEmpty) {
        result = result.replaceAll(defaultValue, value);
      }
    });
    return result;
  }

  /// Actualiza múltiples variables a la vez (útil al cargar persistencia)
  void updateAll(Map<String, String> values) {
    values.forEach((key, value) {
      if (_defaults.containsKey(key)) {
        _currentValues[key] = value;
      }
    });
  }

  /// Obtiene el valor actual de una variable
  String getVariable(String key) {
    return _currentValues[key] ?? _defaults[key] ?? '';
  }

  /// Retorna un mapa inmutable de los valores actuales
  Map<String, String> getAllVariables() {
    return Map.unmodifiable(_currentValues);
  }
}
