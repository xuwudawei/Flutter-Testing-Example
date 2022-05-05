import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/models/favorites.dart';

void main() {
  group('Testing favourites Provider', () {
    var favourites = Favorites();
    test('A new item should be added', () {
      var number = 35;
      favourites.add(number);
      expect(favourites.items.contains(number), true);
    });

    test('An item should be removed', () {
      var number = 12;
      favourites.add(number);
      expect(favourites.items.contains(number), true);
      favourites.remove(number);
      expect(favourites.items.contains(number), false);
    });
  });
}
