import 'dart:math';

List<T> reviewShuffle<T>(List<T> items) {
  final result = List<T>.from(items);
  result.shuffle(Random());
  return result;
}

List<String> reviewBuildOptions(
  String correct,
  List<String> pool, {
  int count = 4,
}) {
  final options = <String>{correct};
  final shuffled = reviewShuffle(pool);
  for (final item in shuffled) {
    if (options.length >= count) break;
    if (item == correct) continue;
    options.add(item);
  }
  final result = options.toList()..shuffle(Random());
  return result;
}
