import 'package:flutter_test/flutter_test.dart';
import 'package:sd_games/calculation.dart';

void main() {
  final calc = Calcultations();
  group("calculation test", () {
    test("check the sum", () {
      calc.sum();
      expect(calc.answer, 15);
    });
  });
}
