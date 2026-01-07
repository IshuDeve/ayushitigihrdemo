class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    String delimiter = ",|\n";
    String data = numbers;

    if (numbers.startsWith("//")) {
      var parts = numbers.split("\n");
      delimiter = RegExp.escape(parts[0].substring(2));
      data = parts.sublist(1).join("\n");
    }

    final List<int> parsedNumbers = data
        .split(RegExp(delimiter))
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty)
        .map((s) => int.parse(s))
        .toList();

    _validateNoNegatives(parsedNumbers);

    return parsedNumbers.fold(0, (sum, n) => sum + n);
  }

  void _validateNoNegatives(List<int> nums) {
    final negatives = nums.where((n) => n < 0).toList();
    if (negatives.isNotEmpty) {
      throw Exception("negative numbers not allowed: ${negatives.join(', ')}");
    }
  }
}

