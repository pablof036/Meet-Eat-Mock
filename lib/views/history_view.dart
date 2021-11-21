import 'package:flutter/material.dart';
import 'package:mae/app_data.dart';
import 'package:mae/widgets/order.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({Key? key}) : super(key: key);

  @override
  _HistoryViewState createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                "En progreso",
                style: categoryTextStyle,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate.fixed(
              [OrderCard(order: ongoingOrder)],
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                "Programados",
                style: categoryTextStyle,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => OrderCard(
                order: scheduledOrders[index],
              ),
              childCount: scheduledOrders.length,
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                "Finalizados",
                style: categoryTextStyle,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => OrderCard(
                order: finishedOrders[index],
              ),
              childCount: finishedOrders.length,
            ),
          ),
        ],
      ),
    );
  }
}
