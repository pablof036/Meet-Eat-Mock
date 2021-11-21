import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mae/model/order.dart';
import 'package:mae/pages/order.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({Key? key, required this.order}) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105,
      padding: const EdgeInsets.only(
        left: 4,
        bottom: 8,
      ),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 175,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(4),
                  ),
                  child: Image.asset(
                    order.place.imageAsset,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  minVerticalPadding: 0,
                  title: Text(
                    order.place.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(
                    DateFormat.MMMMd('es_ES').format(order.date),
                  ),
                ),
              ),
            ],
          ),
          Positioned.fill(
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return OrderPage(order);
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
