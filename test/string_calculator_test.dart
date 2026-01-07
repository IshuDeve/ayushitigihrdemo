import 'package:flutter_test/flutter_test.dart';
import 'package:ayushitigihrdemo/string_calculator.dart';

void main() {
  final cal = StringCalculator();

  test('returns 0 for empty string', () {
    expect(cal.add(''), equals(0));
  });
}

