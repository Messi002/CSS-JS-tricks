import 'package:flutter/material.dart';

/// Returns the common linear gradient color used through out the app.
LinearGradient backgroundGradient({
  AlignmentGeometry begin = Alignment.centerLeft,
  AlignmentGeometry end = Alignment.centerRight,
  Color startColor = const Color(0xFFF2B908),
  Color endColor = const Color(0xFFF8D33C),
}) {
  return LinearGradient(colors: [startColor, endColor], begin: begin, end: end);
}
