import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mae/bloc/reserve.dart';
import 'package:mae/model/menu_item.dart';

class MenuItemWidget extends StatefulWidget {
  const MenuItemWidget(this.item, {Key? key, this.showAddButton = false})
      : super(key: key);

  final MenuItem item;
  final bool showAddButton;

  @override
  _MenuItemWidgetState createState() => _MenuItemWidgetState();
}

class _MenuItemWidgetState extends State<MenuItemWidget> {
  bool toggle = true;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(widget.item.imageAsset),
      title: Text(widget.item.name),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('${widget.item.price.toStringAsFixed(2)}€'),
          if (widget.showAddButton)
            IconButton(
              onPressed: () {
                var reserves = BlocProvider.of<ReserveCubit>(context);
                if (toggle) {
                  reserves.addItem(widget.item);
                } else {
                  reserves.removeItem(widget.item);
                }
                setState(
                  () {
                    toggle = !toggle;
                  },
                );
              },
              icon: Icon(
                (toggle) ? Icons.add : Icons.remove,
                color: Colors.black87,
              ),
            ),
        ],
      ),
    );
  }
}
