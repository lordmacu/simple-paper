import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Construye spans de texto con palabras resaltadas.
///
/// Busca coincidencias de [highlights] en [text] y aplica estilos distintos.
List<InlineSpan> buildHighlightedTextSpans({
  required String text,
  required List<String> highlights,
  TextStyle? normalStyle,
  TextStyle? highlightStyle,
  bool caseSensitive = false,
  void Function(String word)? onTap,
}) {
  if (text.isEmpty || highlights.isEmpty) {
    return [
      TextSpan(text: text, style: normalStyle),
    ];
  }

  final sorted = List<String>.from(highlights)
    ..removeWhere((w) => w.trim().isEmpty)
    ..sort((a, b) => b.length.compareTo(a.length));
  if (sorted.isEmpty) {
    return [
      TextSpan(text: text, style: normalStyle),
    ];
  }

  final spans = <InlineSpan>[];
  var remainingText = text;

  while (remainingText.isNotEmpty) {
    var foundMatch = false;
    final remainingProbe =
        caseSensitive ? remainingText : remainingText.toLowerCase();
    for (final word in sorted) {
      final probe = caseSensitive ? word : word.toLowerCase();
      final index = remainingProbe.indexOf(probe);
      if (index == 0) {
        final matchedWord = remainingText.substring(0, word.length);
        spans.add(
          TextSpan(
            text: matchedWord,
            style: highlightStyle ?? normalStyle,
            recognizer: onTap == null
                ? null
                : (TapGestureRecognizer()..onTap = () => onTap(matchedWord)),
          ),
        );
        remainingText = remainingText.substring(word.length);
        foundMatch = true;
        break;
      }
    }

    if (!foundMatch) {
      var nextIndex = remainingText.length;
      for (final word in sorted) {
        final probe = caseSensitive ? word : word.toLowerCase();
        final index =
            (caseSensitive ? remainingText : remainingText.toLowerCase())
                .indexOf(probe);
        if (index > 0 && index < nextIndex) {
          nextIndex = index;
        }
      }
      spans.add(
        TextSpan(
          text: remainingText.substring(0, nextIndex),
          style: normalStyle,
        ),
      );
      remainingText = remainingText.substring(nextIndex);
    }
  }

  return spans;
}
