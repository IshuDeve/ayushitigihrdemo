import 'package:flutter_test/flutter_test.dart';
import 'package:ayushitigihrdemo/string_calculator.dart';

void main() {
  final cal = StringCalculator();

  test('returns 0 for empty string', () {
    expect(cal.add(''), equals(0));
  });

  test('returns number itself for single number', () {
  expect(cal.add('1'), equals(1));
});
  
  test('returns sum of two comma separated numbers', () {
  expect(cal.add('1,5'), equals(6));
});

  test('returns sum of multiple numbers', () {
    expect(cal.add('1,2,3,4'), equals(10));
  });

  test('supports newline as delimiter', () {
    expect(cal.add('1\n2,3'), equals(6));
  });

  test('supports custom delimiter', () {
    expect(cal.add('//;\n1;2'), equals(3));
  });

  test('throws exception for negative numbers', () {
    expect(
          () => cal.add('1,-2,-3'),
      throwsA(
        predicate(
              (e) =>
          e is Exception &&
              e.toString().contains('-2') &&
              e.toString().contains('-3'),
        ),
      ),
    );
  });

  
}

