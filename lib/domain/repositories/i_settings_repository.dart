/// Interface del repositorio de configuración de la app
/// Define el contrato para guardar y recuperar preferencias del usuario
abstract class ISettingsRepository {
  /// Obtiene el idioma preferido del usuario
  /// 
  /// Returns: Código de idioma ('en', 'es')
  /// Default: 'en'
  Future<String> getPreferredLanguage();
  
  /// Establece el idioma preferido
  /// 
  /// [languageCode] - Código de idioma ('en', 'es')
  Future<void> setPreferredLanguage(String languageCode);
  
  /// Obtiene el nombre personalizado del jugador
  /// 
  /// Returns: Nombre del jugador (null si no se ha establecido)
  Future<String?> getPlayerName();
  
  /// Establece el nombre del jugador
  /// 
  /// [name] - Nombre personalizado del jugador
  Future<void> setPlayerName(String name);
  
  /// Obtiene el nombre personalizado del jefe
  /// 
  /// Returns: Nombre del jefe (null si usa el default)
  Future<String?> getBossName();
  
  /// Establece el nombre del jefe
  /// 
  /// [name] - Nombre personalizado del jefe
  Future<void> setBossName(String name);
  
  /// Obtiene la ciudad seleccionada por el usuario
  /// 
  /// Returns: Nombre de la ciudad (null si usa default)
  Future<String?> getSelectedCity();
  
  /// Establece la ciudad seleccionada
  /// 
  /// [city] - Nombre de la ciudad
  Future<void> setSelectedCity(String city);
  
  /// Obtiene el volumen de música
  /// 
  /// Returns: Volumen (0.0 - 1.0)
  /// Default: 0.5
  Future<double> getMusicVolume();
  
  /// Establece el volumen de música
  /// 
  /// [volume] - Volumen (0.0 - 1.0)
  Future<void> setMusicVolume(double volume);
  
  /// Obtiene el volumen de efectos de sonido
  /// 
  /// Returns: Volumen (0.0 - 1.0)
  /// Default: 0.7
  Future<double> getSfxVolume();
  
  /// Establece el volumen de efectos de sonido
  /// 
  /// [volume] - Volumen (0.0 - 1.0)
  Future<void> setSfxVolume(double volume);
  
  /// Verifica si las notificaciones están habilitadas
  /// 
  /// Returns: true si están habilitadas
  /// Default: true
  Future<bool> areNotificationsEnabled();
  
  /// Habilita/deshabilita notificaciones
  /// 
  /// [enabled] - true para habilitar, false para deshabilitar
  Future<void> setNotificationsEnabled(bool enabled);
  
  /// Verifica si el modo oscuro está habilitado
  /// 
  /// Returns: true si está habilitado
  /// Default: false
  Future<bool> isDarkModeEnabled();
  
  /// Habilita/deshabilita modo oscuro
  /// 
  /// [enabled] - true para habilitar, false para deshabilitar
  Future<void> setDarkModeEnabled(bool enabled);
  
  /// Verifica si es la primera vez que se abre la app
  /// 
  /// Returns: true si es la primera vez
  Future<bool> isFirstTime();
  
  /// Marca que la app ya ha sido abierta
  Future<void> markFirstTimeDone();
  
  /// Resetea todas las configuraciones a valores por defecto
  Future<void> resetSettings();
}
