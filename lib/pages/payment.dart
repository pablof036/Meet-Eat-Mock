import 'package:flutter/material.dart';
import 'package:mae/app_data.dart';
import 'package:mae/model/order.dart';
import 'package:mae/widgets/app_title.dart';
import 'package:mae/widgets/do.dart';
import 'package:slidable_button/slidable_button.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage(this.order, {Key? key}) : super(key: key);

  final Order order;

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const AppTitle("Pago"),
        backgroundColor: Colors.grey.shade100,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "${widget.order.getTotalPrice().toStringAsFixed(2)}€",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 64,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(
              height: 128,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: DoButton(
                (position) {
                  if (position == SlidableButtonPosition.right) {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
