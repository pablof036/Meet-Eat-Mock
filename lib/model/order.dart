import 'package:mae/model/menu_item.dart';
import 'package:mae/model/place.dart';

class Order {
  final Place place;
  final DateTime date;
  final List<MenuItem> items;

  const Order({
    required this.place,
    required this.date,
    required this.items,
  });

  double getTotalPrice() {
    var total = 0.0;
    for (var item in items) {
      total += item.price;
    }
    return total;
  }
}
