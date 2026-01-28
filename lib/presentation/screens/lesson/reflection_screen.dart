import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class ReflectionScreen extends StatefulWidget {
  final int maxLength;
  final List<String> practiceWords;
  final void Function(String text) onSubmit;

  const ReflectionScreen({
    Key? key,
    required this.onSubmit,
    this.maxLength = 200,
    this.practiceWords = const [],
  }) : super(key: key);

  @override
  State<ReflectionScreen> createState() => _ReflectionScreenState();
}

class _ReflectionScreenState extends State<ReflectionScreen> {
  final _controller = TextEditingController();
  String? _error;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    final text = _controller.text.trim();
    if (text.length > widget.maxLength) {
      setState(() => _error = 'Máximo ${widget.maxLength} caracteres');
      return;
    }
    setState(() => _error = null);
    widget.onSubmit(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Reflexión',
          style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.w700),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '¿Qué aprendiste hoy? Escríbelo en inglés o español.',
              style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _controller,
              maxLength: widget.maxLength,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Escribe tu reflexión...',
                filled: true,
                fillColor: AppColors.cardBackground,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                errorText: _error,
              ),
            ),
            if (widget.practiceWords.isNotEmpty) ...[
              const SizedBox(height: 10),
              const Text(
                'Palabras para practicar',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: widget.practiceWords
                    .map((w) => Chip(
                          label: Text(w),
                          backgroundColor: AppColors.cardBackground,
                        ))
                    .toList(),
              ),
            ],
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryGreen,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: _handleSubmit,
                child: const Text(
                  'Guardar y continuar',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
