#!/usr/bin/env node

/**
 * Script para agregar documentación básica a archivos Dart
 * Agrega /// comentarios a constructores y parámetros faltantes
 */

const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

// Función para ejecutar dart analyze y obtener warnings
function getDartAnalyzeWarnings() {
  try {
    const output = execSync('cd /Users/cristian/office/office_app && dart analyze', { encoding: 'utf8' });
    return output;
  } catch (error) {
    return error.stdout || error.stderr;
  }
}

// Función para parsear warnings de documentación
function parseDocumentationWarnings(output) {
  const lines = output.split('\n');
  const warnings = [];

  for (const line of lines) {
    if (line.includes('public_member_api_docs')) {
      // Extraer archivo y línea del warning
      const match = line.match(/lib\/([^:]+):(\d+):\d+.*public_member_api_docs/);
      if (match) {
        warnings.push({
          file: match[1],
          line: parseInt(match[2])
        });
      }
    }
  }

  return warnings;
}

// Función para agregar documentación básica a un archivo
function addBasicDocumentation(filePath, warnings) {
  const fullPath = path.join('/Users/cristian/office/office_app/lib', filePath);
  let content = fs.readFileSync(fullPath, 'utf8');
  const lines = content.split('\n');
  let modified = false;

  // Procesar warnings para este archivo
  const fileWarnings = warnings.filter(w => w.file === filePath);

  for (const warning of fileWarnings) {
    const lineIndex = warning.line - 1; // Convertir a 0-based

    if (lineIndex >= 0 && lineIndex < lines.length) {
      const line = lines[lineIndex].trim();

      // Si es una declaración de clase sin documentación
      if (line.includes('class ') && line.includes('extends') && !lines[lineIndex - 1]?.trim().startsWith('///')) {
        // Extraer nombre de la clase
        const className = line.split(' ')[1];
        const screenName = className.replace('Screen', '').replace('Widget', '').replace(/([A-Z])/g, ' $1').toLowerCase().trim();
        lines.splice(lineIndex, 0, '/// ' + screenName + ' screen/widget');
        modified = true;
      }
      // Si es un constructor const sin documentación
      else if (line.startsWith('const ') && line.includes('({') && !lines[lineIndex - 1]?.trim().startsWith('///')) {
        // Agregar documentación al constructor
        const className = path.basename(filePath, '.dart').replace(/_/g, ' ');
        lines.splice(lineIndex, 0, '  /// Crea una instancia de ' + className + '.');
        modified = true;
      }
      // Si es un constructor sin const pero con parámetros
      else if (line.includes('({') && !line.includes('class') && !lines[lineIndex - 1]?.trim().startsWith('///')) {
        // Agregar documentación al constructor
        const className = path.basename(filePath, '.dart').replace(/_/g, ' ');
        lines.splice(lineIndex, 0, '  /// Crea una instancia de ' + className + '.');
        modified = true;
      }
      // Si es un parámetro final sin documentación
      else if (line.startsWith('final ') && !lines[lineIndex - 1]?.trim().startsWith('///')) {
        // Agregar documentación a parámetro final
        const parts = line.split(' ');
        if (parts.length >= 2) {
          const paramName = parts[1];
          lines.splice(lineIndex, 0, '  /// ' + paramName.replace(/([A-Z])/g, ' $1').toLowerCase());
          modified = true;
        }
      }
      // Si es un parámetro required sin documentación
      else if (line.startsWith('required ') && !lines[lineIndex - 1]?.trim().startsWith('///')) {
        // Agregar documentación a parámetro required
        const parts = line.split(' ');
        if (parts.length >= 2) {
          const paramName = parts[parts.length - 1].replace(',', '').replace(';', '');
          lines.splice(lineIndex, 0, '  /// ' + paramName.replace(/([A-Z])/g, ' $1').toLowerCase());
          modified = true;
        }
      }
    }
  }

  if (modified) {
    content = lines.join('\n');
    fs.writeFileSync(fullPath, content);
    console.log(`Actualizado: ${filePath}`);
  }
}

// Función principal
function main() {
  console.log('Analizando warnings de documentación...');

  const output = getDartAnalyzeWarnings();
  const warnings = parseDocumentationWarnings(output);

  console.log(`Encontrados ${warnings.length} warnings de documentación`);

  // Agrupar por archivo
  const files = {};
  for (const warning of warnings) {
    if (!files[warning.file]) {
      files[warning.file] = [];
    }
    files[warning.file].push(warning);
  }

  // Procesar archivos
  for (const [filePath, fileWarnings] of Object.entries(files)) {
    try {
      addBasicDocumentation(filePath, fileWarnings);
    } catch (error) {
      console.error(`Error procesando ${filePath}:`, error.message);
    }
  }

  console.log('Proceso completado. Verifica los cambios con: dart analyze');
}

// Ejecutar
main();