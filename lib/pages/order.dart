import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mae/app_data.dart';
import 'package:mae/model/order.dart';
import 'package:mae/pages/payment.dart';
import 'package:mae/views/order_view.dart';
import 'package:mae/widgets/app_title.dart';

class OrderPage extends StatefulWidget {
  const OrderPage(this.order, {Key? key}) : super(key: key);

  final Order order;

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const AppTitle("Pedido"),
        backgroundColor: Colors.grey.shade100,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PaymentPage(widget.order),
            ),
          );
        },
        backgroundColor: fabColor,
        icon: const Icon(
          Icons.payment,
        ),
        label: const Text(
          "Pagar",
        ),
      ),
      body: OrderView(widget.order),
    );
  }
}
