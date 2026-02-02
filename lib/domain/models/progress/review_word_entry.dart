/// Entrada de palabra para repaso.
///
/// Representa una palabra que el usuario marcó para repasar.
class ReviewWordEntry {
  /// Palabra a repasar.
  final String word;

  /// Nivel del episodio (A1, A2, etc.).
  final String level;

  /// Número del episodio de origen.
  final int episodeNumber;

  /// Cantidad de errores cometidos.
  final int mistakes;

  /// Crea un [ReviewWordEntry].
  const ReviewWordEntry({
    required this.word,
    required this.level,
    required this.episodeNumber,
    required this.mistakes,
  });
}
