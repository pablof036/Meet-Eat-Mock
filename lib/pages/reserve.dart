import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mae/app_data.dart';
import 'package:mae/model/place.dart';
import 'package:mae/model/reserve.dart';
import 'package:mae/views/reserve_view.dart';
import 'package:mae/widgets/app_title.dart';
import 'package:mae/widgets/menu_item.dart';

class ReservePage extends StatefulWidget {
  const ReservePage(this.reserve, this.place, {Key? key}) : super(key: key);

  final Reserve reserve;
  final Place place;

  @override
  _ReservePageState createState() => _ReservePageState();
}

class _ReservePageState extends State<ReservePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        foregroundColor: Colors.black,
        elevation: 0,
        title: const AppTitle("Realizar reserva"),
      ),
      body: ReserveView(widget.reserve, widget.place),
    );
  }
}
