// tool/build_splash_lottie.dart
//
// Generates `assets/animations/splash.json` — a Lottie recreation of the
// reference clip `assets/animations/splash.mp4`.
//
// Run with:  dart run tool/build_splash_lottie.dart
//
// The logo artwork is converted from `assets/svg/logo_name.svg` (potrace
// output: absolute `M`, relative `c` / `l`, `z`) into Lottie bezier shapes, so
// the vectors stay identical to the SVG the app already ships.
//
// The Arabic title and subtitle can't be Lottie *text* layers — no renderer
// does Arabic shaping or RTL, so the glyphs come out disconnected and
// backwards. They're embedded as base64 PNG image layers instead, rendered at
// 3x from the app's own Tajawal font by `tool/render_splash_text.sh`. Two small
// still images, not a frame sequence, so the cost is a few KB.

import 'dart:convert';
import 'dart:io';

// ─── Composition ────────────────────────────────────────────────────────────
const int fps = 30;
const int outPoint = 90; // 3.0s, matching the reference clip's pacing
const double compW = 390;
const double compH = 844;

// Sampled from the reference clip.
const List<double> bgTop = [0, 0.251, 0.157]; // #004028
const List<double> bgBottom = [0, 0.341, 0.208]; // #005735
const List<double> gold = [0.796, 0.647, 0.388]; // #CBA563

const double badgeSize = 112;
const double badgeRadius = 30;
const double badgeCx = compW / 2;
const double badgeCy = 330;

/// The SVG's user-space box — the `viewBox` the potrace transform maps into.
const double svgBox = 4565;
const double logoFit = 96; // drawn size inside the badge

/// Text PNGs are rendered at 3x and scaled back down, so they stay sharp on
/// high-density screens.
const double textScale = 3;
const double titleY = 455;
const double subtitleY = 524;
const double subtitleOpacity = 72;

void main() {
  final svg = File('assets/svg/logo_name.svg').readAsStringSync();
  final groups = _parseSvgGroups(svg);
  if (groups.isEmpty) {
    stderr.writeln('no <g> path groups found in logo_name.svg');
    exit(1);
  }

  final title = _loadTextImage('title', 'build/txt/title.png');
  final subtitle = _loadTextImage('subtitle', 'build/txt/sub.png');

  final lottie = {
    'v': '5.7.6',
    'fr': fps,
    'ip': 0,
    'op': outPoint,
    'w': compW,
    'h': compH,
    'nm': 'dawrify_splash',
    'ddd': 0,
    'assets': [title.asset, subtitle.asset],
    'layers': [
      _textLayer(1, subtitle, subtitleY, from: 24, to: 38,
          maxOpacity: subtitleOpacity),
      _textLayer(2, title, titleY, from: 12, to: 27),
      _dotsLayer(3),
      _underlineLayer(4),
      _logoLayer(5, groups),
      _badgeLayer(6),
      _backgroundLayer(7),
    ],
  };

  final out = File('assets/animations/splash.json');
  out.writeAsStringSync(jsonEncode(lottie));
  final kb = (out.lengthSync() / 1024).toStringAsFixed(1);
  stdout.writeln('wrote ${out.path}  ($kb KB, ${groups.length} colour groups)');
}

// ─── Text images ────────────────────────────────────────────────────────────

class _TextImage {
  final String id;
  final int width;
  final int height;
  final Map<String, dynamic> asset;
  _TextImage(this.id, this.width, this.height, this.asset);
}

/// Embeds a rendered text PNG as a Lottie image asset.
_TextImage _loadTextImage(String id, String path) {
  final file = File(path);
  if (!file.existsSync()) {
    stderr.writeln('missing $path — run tool/render_splash_text.sh first');
    exit(1);
  }

  final bytes = file.readAsBytesSync();
  final size = _pngSize(bytes);

  return _TextImage(id, size.$1, size.$2, {
    'id': id,
    'w': size.$1,
    'h': size.$2,
    'u': '',
    'p': 'data:image/png;base64,${base64Encode(bytes)}',
    'e': 1,
  });
}

/// Reads width / height straight out of the PNG IHDR chunk.
(int, int) _pngSize(List<int> bytes) {
  int be32(int at) =>
      (bytes[at] << 24) | (bytes[at + 1] << 16) | (bytes[at + 2] << 8) |
          bytes[at + 3];
  return (be32(16), be32(20));
}

/// One line of Arabic, centred on [centreY] in composition coordinates.
Map<String, dynamic> _textLayer(
  int ind,
  _TextImage image,
  double centreY, {
  required int from,
  required int to,
  double maxOpacity = 100,
}) =>
    {
      'ddd': 0,
      'ind': ind,
      'ty': 2, // image
      'nm': image.id,
      'refId': image.id,
      'sr': 1,
      'ks': {
        'o': _fadeIn(from: from, to: to, maxOpacity: maxOpacity),
        'r': _static(0),
        // Rises into place rather than just appearing.
        'p': _keyframes([
          _Stop(from, [compW / 2, centreY + 18, 0]),
          _Stop(to, [compW / 2, centreY, 0]),
        ]),
        'a': _static([image.width / 2, image.height / 2, 0]),
        's': _static([100 / textScale, 100 / textScale, 100]),
      },
      'ao': 0,
      'ip': 0,
      'op': outPoint,
      'st': 0,
      'bm': 0,
    };

// ─── Layers ─────────────────────────────────────────────────────────────────

/// Full-bleed vertical gradient.
Map<String, dynamic> _backgroundLayer(int ind) => {
      'ddd': 0,
      'ind': ind,
      'ty': 4,
      'nm': 'background',
      'sr': 1,
      'ks': _transform(position: [compW / 2, compH / 2]),
      'ao': 0,
      'shapes': [
        {
          'ty': 'gr',
          'nm': 'bg',
          'it': [
            {
              'ty': 'rc',
              'd': 1,
              's': _static([compW, compH]),
              'p': _static([0, 0]),
              'r': _static(0),
            },
            {
              'ty': 'gf',
              'o': _static(100),
              'r': 1,
              // p:2 → two stops; k is [pos, r,g,b, pos, r,g,b]
              'g': {
                'p': 2,
                'k': _static([0, ...bgTop, 1, ...bgBottom]),
              },
              't': 1, // linear
              's': _static([0, -compH / 2]),
              'e': _static([0, compH / 2]),
            },
            _shapeTransform(),
          ],
        }
      ],
      'ip': 0,
      'op': outPoint,
      'st': 0,
      'bm': 0,
    };

/// White rounded badge — scales in with a slight overshoot.
Map<String, dynamic> _badgeLayer(int ind) => {
      'ddd': 0,
      'ind': ind,
      'ty': 4,
      'nm': 'badge',
      'sr': 1,
      'ks': {
        'o': _fadeIn(from: 0, to: 8),
        'r': _static(0),
        'p': _static([badgeCx, badgeCy, 0]),
        'a': _static([0, 0, 0]),
        's': _popIn(),
      },
      'ao': 0,
      'shapes': [
        {
          'ty': 'gr',
          'nm': 'badge',
          'it': [
            {
              'ty': 'rc',
              'd': 1,
              's': _static([badgeSize, badgeSize]),
              'p': _static([0, 0]),
              'r': _static(badgeRadius),
            },
            {
              'ty': 'fl',
              'c': _static([1, 1, 1, 1]),
              'o': _static(100),
              'r': 1,
            },
            _shapeTransform(),
          ],
        }
      ],
      'ip': 0,
      'op': outPoint,
      'st': 0,
      'bm': 0,
    };

/// The logo lockup, converted from the SVG. Rides the same pop-in as the badge.
Map<String, dynamic> _logoLayer(int ind, List<_SvgGroup> groups) {
  final scale = logoFit / svgBox * 100;

  return {
    'ddd': 0,
    'ind': ind,
    'ty': 4,
    'nm': 'logo',
    'sr': 1,
    'ks': {
      'o': _fadeIn(from: 0, to: 8),
      'r': _static(0),
      'p': _static([badgeCx, badgeCy, 0]),
      'a': _static([svgBox / 2, svgBox / 2, 0]),
      // Multiply the pop-in by the fit scale so the logo tracks the badge.
      's': _popIn(multiplier: scale / 100),
    },
    'ao': 0,
    'shapes': [
      for (final group in groups)
        {
          'ty': 'gr',
          'nm': group.fill,
          'it': [
            for (final subpath in group.subpaths) _pathShape(subpath),
            {
              'ty': 'fl',
              'c': _static([...group.rgb, 1]),
              'o': _static(100),
              'r': 1,
            },
            _shapeTransform(),
          ],
        },
    ],
    'ip': 0,
    'op': outPoint,
    'st': 0,
    'bm': 0,
  };
}

/// Gold rule that wipes out from the centre.
Map<String, dynamic> _underlineLayer(int ind) => {
      'ddd': 0,
      'ind': ind,
      'ty': 4,
      'nm': 'underline',
      'sr': 1,
      'ks': {
        'o': _static(100),
        'r': _static(0),
        'p': _static([compW / 2, 497, 0]),
        'a': _static([0, 0, 0]),
        's': _keyframes([
          _Stop(21, [0, 100, 100]),
          _Stop(33, [100, 100, 100]),
        ]),
      },
      'ao': 0,
      'shapes': [
        {
          'ty': 'gr',
          'nm': 'rule',
          'it': [
            {
              'ty': 'rc',
              'd': 1,
              's': _static([62, 2.5]),
              'p': _static([0, 0]),
              'r': _static(2),
            },
            {
              'ty': 'fl',
              'c': _static([...gold, 1]),
              'o': _static(100),
              'r': 1,
            },
            _shapeTransform(),
          ],
        }
      ],
      'ip': 0,
      'op': outPoint,
      'st': 0,
      'bm': 0,
    };

/// Three progress dots; the first is gold, the rest are dimmed white.
Map<String, dynamic> _dotsLayer(int ind) {
  const double gap = 14;
  const double r = 3.5;

  return {
    'ddd': 0,
    'ind': ind,
    'ty': 4,
    'nm': 'dots',
    'sr': 1,
    'ks': {
      'o': _fadeIn(from: 30, to: 44),
      'r': _static(0),
      'p': _static([compW / 2, 764, 0]),
      'a': _static([0, 0, 0]),
      's': _static([100, 100, 100]),
    },
    'ao': 0,
    'shapes': [
      for (var i = 0; i < 3; i++)
        {
          'ty': 'gr',
          'nm': 'dot$i',
          'it': [
            {
              'ty': 'el',
              'd': 1,
              's': _static([r * 2, r * 2]),
              'p': _static([(i - 1) * gap, 0]),
            },
            {
              'ty': 'fl',
              'c': _static(i == 0 ? [...gold, 1] : [1, 1, 1, 1]),
              'o': _static(i == 0 ? 100 : 25),
              'r': 1,
            },
            _shapeTransform(),
          ],
        },
    ],
    'ip': 0,
    'op': outPoint,
    'st': 0,
    'bm': 0,
  };
}

// ─── Animation helpers ──────────────────────────────────────────────────────

/// One stop on an animated property.
class _Stop {
  final int frame;
  final List<num> value;
  const _Stop(this.frame, this.value);
}

/// Builds a keyframe list.
///
/// Every keyframe carries both `s` (start) and `e` (end), and the list is
/// terminated by a bare `{t: lastFrame}`. Omitting either makes lottie-web
/// extrapolate past the final keyframe — which silently produced a
/// `matrix(-9999.99, …)` transform and painted shapes across the whole
/// canvas.
Map<String, dynamic> _keyframes(
  List<_Stop> stops, {
  List<double> out = const [0.33, 0],
  List<double> inn = const [0.67, 1],
}) {
  final keys = <Map<String, dynamic>>[];

  for (var i = 0; i < stops.length - 1; i++) {
    final from = stops[i];
    final to = stops[i + 1];
    final n = from.value.length;
    keys.add({
      't': from.frame,
      's': from.value,
      'e': to.value,
      'o': {'x': List.filled(n, out[0]), 'y': List.filled(n, out[1])},
      'i': {'x': List.filled(n, inn[0]), 'y': List.filled(n, inn[1])},
    });
  }
  keys.add({'t': stops.last.frame});

  return {'a': 1, 'k': keys};
}

/// Scale keyframes with a small overshoot, mirroring `Curves.easeOutBack`.
Map<String, dynamic> _popIn({double multiplier = 1}) {
  double s(double v) => v * multiplier;
  return _keyframes(
    [
      _Stop(0, [s(55), s(55), 100]),
      _Stop(14, [s(106), s(106), 100]),
      _Stop(20, [s(100), s(100), 100]),
    ],
    out: [0.2, 0],
    inn: [0.4, 1],
  );
}

Map<String, dynamic> _fadeIn({
  required int from,
  required int to,
  double maxOpacity = 100,
}) =>
    _keyframes([
      _Stop(from, [0]),
      _Stop(to, [maxOpacity]),
    ]);

Map<String, dynamic> _static(dynamic value) => {'a': 0, 'k': value};

Map<String, dynamic> _transform({required List<double> position}) => {
      'o': _static(100),
      'r': _static(0),
      'p': _static([...position, 0]),
      'a': _static([0, 0, 0]),
      's': _static([100, 100, 100]),
    };

/// The identity transform every Lottie shape group must end with.
Map<String, dynamic> _shapeTransform() => {
      'ty': 'tr',
      'p': _static([0, 0]),
      'a': _static([0, 0]),
      's': _static([100, 100]),
      'r': _static(0),
      'o': _static(100),
      'sk': _static(0),
      'sa': _static(0),
    };

Map<String, dynamic> _pathShape(_Subpath subpath) => {
      'ty': 'sh',
      'ind': 0,
      'ks': _static({
        'i': subpath.inTangents,
        'o': subpath.outTangents,
        'v': subpath.vertices,
        'c': subpath.closed,
      }),
      'nm': 'path',
    };

// ─── SVG parsing ────────────────────────────────────────────────────────────

class _SvgGroup {
  final String fill;
  final List<double> rgb;
  final List<_Subpath> subpaths;
  _SvgGroup(this.fill, this.rgb, this.subpaths);
}

class _Subpath {
  final List<List<double>> vertices = [];
  final List<List<double>> inTangents = [];
  final List<List<double>> outTangents = [];
  bool closed = false;
}

List<_SvgGroup> _parseSvgGroups(String svg) {
  final groups = <_SvgGroup>[];

  // Each <g fill="#rrggbb"> ... </g> is one colour of the lockup.
  final gRe = RegExp(r'<g[^>]*fill="(#[0-9A-Fa-f]{6})"[^>]*>(.*?)</g>',
      dotAll: true);
  final dRe = RegExp(r'\sd="([^"]*)"', dotAll: true);

  for (final g in gRe.allMatches(svg)) {
    final fill = g.group(1)!;
    final body = g.group(2)!;
    final subpaths = <_Subpath>[];
    for (final d in dRe.allMatches(body)) {
      subpaths.addAll(_parsePath(d.group(1)!));
    }
    if (subpaths.isNotEmpty) {
      groups.add(_SvgGroup(fill, _hexToRgb(fill), subpaths));
    }
  }
  return groups;
}

List<double> _hexToRgb(String hex) {
  final v = int.parse(hex.substring(1), radix: 16);
  return [
    _round(((v >> 16) & 0xFF) / 255),
    _round(((v >> 8) & 0xFF) / 255),
    _round((v & 0xFF) / 255),
  ];
}

/// Applies potrace's `translate(0, 4565) scale(0.1, -0.1)` and rounds.
List<double> _project(double x, double y) =>
    [_round(x * 0.1), _round(svgBox - y * 0.1)];

/// Same transform for a delta vector (tangents are relative, so no translate).
List<double> _projectDelta(double dx, double dy) =>
    [_round(dx * 0.1), _round(-dy * 0.1)];

double _round(double v) => (v * 100).roundToDouble() / 100;

/// Handles the command set potrace emits: absolute `M`, relative `c` / `l`,
/// and `z`. Throws on anything else so a future SVG can't silently degrade.
List<_Subpath> _parsePath(String d) {
  final tokens = RegExp(r'[MmLlCcZz]|-?\d*\.?\d+')
      .allMatches(d)
      .map((m) => m.group(0)!)
      .toList();

  final subpaths = <_Subpath>[];
  _Subpath? current;
  double cx = 0, cy = 0;
  var i = 0;

  double num_() => double.parse(tokens[i++]);

  void ensure() {
    if (current == null) throw StateError('path data before first moveto');
  }

  while (i < tokens.length) {
    final cmd = tokens[i];
    if (RegExp(r'^[A-Za-z]$').hasMatch(cmd)) {
      i++;
      switch (cmd) {
        case 'M':
        case 'm':
          final x = num_(), y = num_();
          cx = cmd == 'M' ? x : cx + x;
          cy = cmd == 'M' ? y : cy + y;
          current = _Subpath()
            ..vertices.add(_project(cx, cy))
            ..inTangents.add([0, 0])
            ..outTangents.add([0, 0]);
          subpaths.add(current);
        case 'l':
        case 'L':
          ensure();
          final x = num_(), y = num_();
          cx = cmd == 'L' ? x : cx + x;
          cy = cmd == 'L' ? y : cy + y;
          current!.vertices.add(_project(cx, cy));
          current.inTangents.add([0, 0]);
          current.outTangents.add([0, 0]);
        case 'c':
        case 'C':
          ensure();
          final x1 = num_(), y1 = num_();
          final x2 = num_(), y2 = num_();
          final x = num_(), y = num_();
          final abs = cmd == 'C';
          // Lottie tangents are relative to their own vertex.
          final c1 = abs ? [x1 - cx, y1 - cy] : [x1, y1];
          final endX = abs ? x : cx + x;
          final endY = abs ? y : cy + y;
          final c2 = abs ? [x2 - x, y2 - y] : [x2 - x, y2 - y];

          current!.outTangents[current.outTangents.length - 1] =
              _projectDelta(c1[0], c1[1]);
          current.vertices.add(_project(endX, endY));
          current.inTangents.add(_projectDelta(c2[0], c2[1]));
          current.outTangents.add([0, 0]);
          cx = endX;
          cy = endY;
        case 'z':
        case 'Z':
          ensure();
          current!.closed = true;
          // A closed contour repeats its first point implicitly in Lottie.
          if (current.vertices.length > 1 &&
              _samePoint(current.vertices.first, current.vertices.last)) {
            final lastIn = current.inTangents.removeLast();
            current.vertices.removeLast();
            current.outTangents.removeLast();
            current.inTangents[0] = lastIn;
          }
          cx = current.vertices.first[0] * 10;
          cy = (svgBox - current.vertices.first[1]) * 10;
        default:
          throw UnsupportedError('unhandled SVG path command "$cmd"');
      }
    } else {
      throw FormatException('unexpected token "$cmd" in path data');
    }

    // Repeated coordinate sets after a command reuse that command.
    while (i < tokens.length && !RegExp(r'^[A-Za-z]$').hasMatch(tokens[i])) {
      final repeat = cmd == 'M' ? 'L' : (cmd == 'm' ? 'l' : cmd);
      tokens.insert(i, repeat);
      break;
    }
  }

  return subpaths.where((s) => s.vertices.length > 1).toList();
}

bool _samePoint(List<double> a, List<double> b) =>
    (a[0] - b[0]).abs() < 0.01 && (a[1] - b[1]).abs() < 0.01;
