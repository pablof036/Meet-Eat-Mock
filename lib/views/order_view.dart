import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mae/app_data.dart';
import 'package:mae/model/order.dart';
import 'package:mae/widgets/menu_item.dart';

class OrderView extends StatefulWidget {
  const OrderView(this.order, {Key? key}) : super(key: key);

  final Order order;

  @override
  _OrderViewState createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          Text(
            'Tu pedido en "${widget.order.place.name}"',
            style: titleTextStyle,
          ),
          const SizedBox(
            height: 16,
          ),
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(18),
                  child: const Text(
                    "Productos",
                    style: categoryTextStyle,
                  ),
                ),
                for (final item in widget.order.items) MenuItemWidget(item),
                const Divider(),
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Text(
                          "Fecha",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Text(
                        DateFormat.MMMd('es_ES').format(widget.order.date),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Text(
                          "Total a pagar",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Text(
                        "${widget.order.getTotalPrice().toStringAsFixed(2)}€",
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
