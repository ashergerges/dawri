// tool/verify_splash_lottie.dart
//
// Renders the shape data inside `assets/animations/splash.json` back out as an
// SVG so the bezier conversion can be eyeballed (and screenshotted) without a
// Lottie player. Verification only — nothing here ships.
//
// Run with:  dart run tool/verify_splash_lottie.dart

import 'dart:convert';
import 'dart:io';

void main() {
  final lottie = jsonDecode(
    File('assets/animations/splash.json').readAsStringSync(),
  ) as Map<String, dynamic>;

  final layers = (lottie['layers'] as List).cast<Map<String, dynamic>>();
  final logo = layers.firstWhere((l) => l['nm'] == 'logo');

  final buffer = StringBuffer()
    ..writeln('<svg xmlns="http://www.w3.org/2000/svg" width="456" '
        'height="456" viewBox="0 0 4565 4565">')
    ..writeln('<rect width="4565" height="4565" fill="#ffffff"/>');

  var pathCount = 0;
  double minX = double.infinity, minY = double.infinity;
  double maxX = -double.infinity, maxY = -double.infinity;

  for (final group in (logo['shapes'] as List).cast<Map<String, dynamic>>()) {
    final items = (group['it'] as List).cast<Map<String, dynamic>>();
    final fill = items.firstWhere((i) => i['ty'] == 'fl');
    final rgba = ((fill['c'] as Map)['k'] as List).cast<num>();
    final hex = _hex(rgba);
    final groupPath = StringBuffer();

    for (final item in items.where((i) => i['ty'] == 'sh')) {
      final ks = ((item['ks'] as Map)['k'] as Map);
      final v = (ks['v'] as List).map((e) => (e as List).cast<num>()).toList();
      final i = (ks['i'] as List).map((e) => (e as List).cast<num>()).toList();
      final o = (ks['o'] as List).map((e) => (e as List).cast<num>()).toList();
      final closed = ks['c'] == true;

      for (final p in v) {
        if (p[0] < minX) minX = p[0].toDouble();
        if (p[0] > maxX) maxX = p[0].toDouble();
        if (p[1] < minY) minY = p[1].toDouble();
        if (p[1] > maxY) maxY = p[1].toDouble();
      }

      // All subpaths of a colour group share one <path> so potrace's
      // reverse-wound holes punch through, exactly as Lottie's non-zero
      // fill ("r": 1) renders them.
      groupPath.write(_toSvgPath(v, i, o, closed));
      pathCount++;
    }

    buffer.writeln(
      '<path fill="$hex" fill-rule="nonzero" d="$groupPath"/>',
    );
  }

  buffer.writeln('</svg>');
  File('build/splash_check.svg').createSync(recursive: true);
  File('build/splash_check.svg').writeAsStringSync(buffer.toString());

  stdout
    ..writeln('subpaths: $pathCount')
    ..writeln('bounds:   x $minX..$maxX   y $minY..$maxY')
    ..writeln('expected: roughly 0..4565 on both axes')
    ..writeln('wrote build/splash_check.svg');
}

String _hex(List<num> rgba) {
  String c(num v) =>
      (v * 255).round().clamp(0, 255).toRadixString(16).padLeft(2, '0');
  return '#${c(rgba[0])}${c(rgba[1])}${c(rgba[2])}';
}

/// Lottie tangents are relative to their vertex; SVG cubics are absolute.
String _toSvgPath(
  List<List<num>> v,
  List<List<num>> inT,
  List<List<num>> outT,
  bool closed,
) {
  final b = StringBuffer('M${v[0][0]},${v[0][1]}');
  for (var k = 1; k < v.length; k++) {
    final c1 = [v[k - 1][0] + outT[k - 1][0], v[k - 1][1] + outT[k - 1][1]];
    final c2 = [v[k][0] + inT[k][0], v[k][1] + inT[k][1]];
    b.write('C${c1[0]},${c1[1]} ${c2[0]},${c2[1]} ${v[k][0]},${v[k][1]}');
  }
  if (closed) {
    final last = v.length - 1;
    final c1 = [v[last][0] + outT[last][0], v[last][1] + outT[last][1]];
    final c2 = [v[0][0] + inT[0][0], v[0][1] + inT[0][1]];
    b.write('C${c1[0]},${c1[1]} ${c2[0]},${c2[1]} ${v[0][0]},${v[0][1]}Z');
  }
  return b.toString();
}
