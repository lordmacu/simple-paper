#!/usr/bin/env python3
"""
Script para optimizar favicon e iconos de la app web.
Usa el avatar de Leo como base para todos los iconos.
"""

from PIL import Image
import os

# Ruta base
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
AVATAR_SOURCE = os.path.join(BASE_DIR, 'assets/avatars/leo_01.png')
WEB_DIR = os.path.join(BASE_DIR, 'web')

def optimize_and_save(source_path, output_path, size, quality=85):
    """Redimensiona y optimiza una imagen PNG."""
    with Image.open(source_path) as img:
        # Convertir a RGBA si no lo es
        if img.mode != 'RGBA':
            img = img.convert('RGBA')
        
        # Redimensionar con alta calidad
        resized = img.resize((size, size), Image.Resampling.LANCZOS)
        
        # Guardar optimizado
        resized.save(output_path, 'PNG', optimize=True)
        
        # Mostrar tamaño resultante
        file_size = os.path.getsize(output_path)
        print(f"✓ {os.path.basename(output_path)}: {size}x{size}px, {file_size/1024:.1f}KB")

def main():
    print(f"📷 Fuente: {AVATAR_SOURCE}")
    print(f"📁 Destino: {WEB_DIR}")
    print()
    
    # Verificar que existe la imagen fuente
    if not os.path.exists(AVATAR_SOURCE):
        print(f"❌ No se encontró la imagen fuente: {AVATAR_SOURCE}")
        return
    
    # Crear directorio icons si no existe
    icons_dir = os.path.join(WEB_DIR, 'icons')
    os.makedirs(icons_dir, exist_ok=True)
    
    # Generar favicon (32x32)
    print("🎨 Generando favicon...")
    optimize_and_save(AVATAR_SOURCE, os.path.join(WEB_DIR, 'favicon.png'), 32)
    
    # Generar iconos de la app
    print("\n🎨 Generando iconos de la app...")
    icons = [
        ('Icon-192.png', 192),
        ('Icon-512.png', 512),
        ('Icon-maskable-192.png', 192),
        ('Icon-maskable-512.png', 512),
    ]
    
    for filename, size in icons:
        output_path = os.path.join(icons_dir, filename)
        optimize_and_save(AVATAR_SOURCE, output_path, size)
    
    print("\n✅ ¡Iconos optimizados correctamente!")
    
    # Mostrar tamaño total
    total_size = 0
    for root, dirs, files in os.walk(WEB_DIR):
        for f in files:
            if f.endswith('.png') and ('icon' in f.lower() or 'favicon' in f.lower()):
                total_size += os.path.getsize(os.path.join(root, f))
    print(f"📊 Tamaño total de iconos: {total_size/1024:.1f}KB")

if __name__ == '__main__':
    main()
