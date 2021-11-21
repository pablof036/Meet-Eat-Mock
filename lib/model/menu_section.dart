import 'package:mae/model/menu.dart';
import 'package:mae/model/menu_item.dart';

class MenuSection {
  final String title;
  final List<MenuItem> items;

  const MenuSection({required this.title, required this.items});
}