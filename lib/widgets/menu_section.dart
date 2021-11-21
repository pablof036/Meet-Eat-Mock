import 'package:flutter/material.dart';
import 'package:mae/model/menu_section.dart';
import 'package:mae/widgets/menu_item.dart';

class MenuSectionWidget extends StatelessWidget {
  const MenuSectionWidget({Key? key, required this.section}) : super(key: key);

  final MenuSection section;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 16),
          child: Text(
            section.title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
        for (final item in section.items)
          MenuItemWidget(
            item,
            showAddButton: true,
          ),
      ],
    );
  }
}
