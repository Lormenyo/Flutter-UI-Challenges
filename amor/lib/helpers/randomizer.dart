import 'dart:math';

class Randomizer {
  static int random(int min, int max) {
    return min + Random().nextInt(max - min);
  }
}
