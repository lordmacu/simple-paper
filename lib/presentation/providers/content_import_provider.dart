import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/services/content_import_service.dart';

/// Provider del servicio de importación de contenido.
final contentImportServiceProvider = Provider<ContentImportService>(
  (ref) => ContentImportService(),
);
