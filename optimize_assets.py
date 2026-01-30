#!/usr/bin/env python3
"""
Script para optimizar todas las imágenes PNG en la carpeta assets.
Reduce el tamaño de archivo sin cambiar nombres ni dimensiones.
"""

from PIL import Image
import os
import sys

def get_file_size_kb(path):
    """Retorna el tamaño del archivo en KB."""
    return os.path.getsize(path) / 1024

def optimize_png(file_path, max_size=None, quality=85):
    """
    Optimiza una imagen PNG.
    - Si max_size es None, mantiene las dimensiones originales.
    - Si max_size es un número, redimensiona si es más grande.
    """
    try:
        original_size = get_file_size_kb(file_path)
        
        with Image.open(file_path) as img:
            # Obtener dimensiones originales
            original_dims = img.size
            
            # Convertir a RGBA si es necesario
            if img.mode != 'RGBA':
                img = img.convert('RGBA')
            
            # Redimensionar si es necesario
            if max_size and (img.width > max_size or img.height > max_size):
                # Mantener aspect ratio
                ratio = min(max_size / img.width, max_size / img.height)
                new_size = (int(img.width * ratio), int(img.height * ratio))
                img = img.resize(new_size, Image.Resampling.LANCZOS)
            
            # Guardar optimizado
            img.save(file_path, 'PNG', optimize=True)
        
        new_size = get_file_size_kb(file_path)
        reduction = ((original_size - new_size) / original_size) * 100 if original_size > 0 else 0
        
        return {
            'original_kb': original_size,
            'new_kb': new_size,
            'reduction': reduction,
            'dims': original_dims
        }
    except Exception as e:
        return {'error': str(e)}

def main():
    # Directorio de assets
    if len(sys.argv) > 1:
        assets_dir = sys.argv[1]
    else:
        assets_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'assets')
    
    print(f"📁 Optimizando imágenes en: {assets_dir}")
    print("=" * 60)
    
    # Estadísticas
    total_original = 0
    total_new = 0
    files_processed = 0
    errors = []
    
    # Recorrer todos los archivos
    for root, dirs, files in os.walk(assets_dir):
        for filename in files:
            if filename.lower().endswith('.png'):
                file_path = os.path.join(root, filename)
                rel_path = os.path.relpath(file_path, assets_dir)
                
                result = optimize_png(file_path)
                
                if 'error' in result:
                    errors.append((rel_path, result['error']))
                    print(f"❌ {rel_path}: {result['error']}")
                else:
                    total_original += result['original_kb']
                    total_new += result['new_kb']
                    files_processed += 1
                    
                    if result['reduction'] > 1:
                        print(f"✓ {rel_path}: {result['original_kb']:.1f}KB → {result['new_kb']:.1f}KB (-{result['reduction']:.1f}%)")
                    else:
                        print(f"· {rel_path}: {result['new_kb']:.1f}KB (ya optimizado)")
    
    # Resumen
    print("=" * 60)
    print(f"\n📊 RESUMEN:")
    print(f"   Archivos procesados: {files_processed}")
    print(f"   Tamaño original: {total_original:.1f}KB ({total_original/1024:.2f}MB)")
    print(f"   Tamaño nuevo: {total_new:.1f}KB ({total_new/1024:.2f}MB)")
    
    if total_original > 0:
        total_reduction = ((total_original - total_new) / total_original) * 100
        saved = total_original - total_new
        print(f"   Reducción: {total_reduction:.1f}% ({saved:.1f}KB ahorrados)")
    
    if errors:
        print(f"\n⚠️  Errores: {len(errors)}")
        for path, error in errors:
            print(f"   - {path}: {error}")
    
    print("\n✅ ¡Optimización completada!")

if __name__ == '__main__':
    main()
