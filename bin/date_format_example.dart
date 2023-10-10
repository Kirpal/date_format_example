// ignore_for_file: avoid_print

import 'dart:math';

import 'package:intl/intl.dart';

final patterns = [
  'd',
  'E',
  'EEEE',
  'LLL',
  'LLLL',
  'M',
  'Md',
  'MEd',
  'MMM',
  'MMMd',
  'MMMEd',
  'MMMM',
  'MMMMd',
  'MMMMEEEEd',
  'QQQ',
  'QQQQ',
  'y',
  'yM',
  'yMd',
  'yMEd',
  'yMMM',
  'yMMMd',
  'yMMMEd',
  'yMMMM',
  'yMMMMd',
  'yMMMMEEEEd',
  'yQQQ',
  'yQQQQ',
  'H',
  'Hm',
  'Hms',
  'j',
  'jm',
  'jms',
  'm',
  'ms',
  's',
];

void outputPattern(String pattern, int firstColumnWidth) {
  final now = DateTime.now();
  final format = DateFormat(pattern);

  print('${pattern.padRight(firstColumnWidth)}  |  ${format.format(now)}');
}

void main(List<String> args) {
  if (args.isNotEmpty && (args.first == '-h' || args.first == '--help')) {
    print('Usage: date_format_example [formats]');
    return;
  }

  const patternTitle = 'Pattern';
  final effectivePatterns = args.isEmpty ? patterns : args;
  final longestPattern = effectivePatterns.fold(
    0,
    (previousValue, element) => max(previousValue, element.length),
  );
  final firstColumnWidth = max(longestPattern, patternTitle.length);

  print('${patternTitle.padRight(firstColumnWidth)}  |  Example');
  print('-' * (2 * firstColumnWidth + 5));
  for (final pattern in effectivePatterns) {
    outputPattern(pattern, firstColumnWidth);
  }
}
