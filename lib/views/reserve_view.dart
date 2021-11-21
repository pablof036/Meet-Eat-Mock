import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mae/app_data.dart';
import 'package:mae/model/order.dart';
import 'package:mae/model/place.dart';
import 'package:mae/model/reserve.dart';
import 'package:mae/widgets/do.dart';
import 'package:mae/widgets/menu_item.dart';
import 'package:slidable_button/slidable_button.dart';

class ReserveView extends StatefulWidget {
  const ReserveView(this.reserve, this.place, {Key? key}) : super(key: key);

  final Reserve reserve;
  final Place place;

  @override
  _ReserveViewState createState() => _ReserveViewState();
}

class _ReserveViewState extends State<ReserveView> {
  int _guestAmount = 0;
  late final _guestAmountController = TextEditingController(
    text: _guestAmount.toString(),
  );

  DateTime _date = DateTime.now();
  TimeOfDay _time = TimeOfDay(hour: 0, minute: 0);

  @override
  Widget build(BuildContext context) {
    var price = 0.0;
    for (final item in widget.reserve.items) {
      price += item.price;
    }

    return Container(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          Text(
            'Tu reserva en "${widget.place.name}"',
            style: titleTextStyle,
          ),
          const SizedBox(
            height: 16,
          ),
          Card(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              const Text("Asistentes"),
                              SizedBox(
                                width: 24,
                                child: TextField(
                                  controller: _guestAmountController,
                                  textAlign: TextAlign.right,
                                  decoration: null,
                                ),
                              ),
                              SizedBox(
                                width: 32,
                                child: IconButton(
                                  onPressed: () {
                                    setState(
                                      () {
                                        _guestAmount++;
                                      },
                                    );
                                    _guestAmountController.text =
                                        _guestAmount.toString();
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                    size: 16,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 32,
                                child: IconButton(
                                  onPressed: (_guestAmount == 0)
                                      ? null
                                      : () {
                                          setState(
                                            () {
                                              _guestAmount--;
                                            },
                                          );
                                          _guestAmountController.text =
                                              _guestAmount.toString();
                                        },
                                  icon: const Icon(
                                    Icons.remove,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            final date = await showDatePicker(
                              context: context,
                              initialDate: _date,
                              firstDate: DateTime.now(),
                              lastDate: DateTime.now().add(
                                const Duration(days: 62),
                              ),
                            );
                            if (date != null) {
                              setState(
                                () {
                                  _date = date;
                                },
                              );
                            }
                          },
                          child: Text(
                            DateFormat.yMd('es_ES').format(_date),
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            final time = await showTimePicker(
                              context: context,
                              initialTime: _time,
                            );
                            if (time != null) {
                              setState(() {
                                _time = time;
                              });
                            }
                          },
                          child: Text(
                            _time.format(context),
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 1,
                  ),
                  for (final item in widget.reserve.items) MenuItemWidget(item),
                  const Divider(
                    height: 1,
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 16,
                      top: 8,
                      bottom: 12,
                      right: 16,
                    ),
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
                          "${price.toStringAsFixed(2)}€",
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
          ),
          const SizedBox(
            height: 32,
          ),
          DoButton(
            (position) {
              scheduledOrders.add(
                Order(
                  place: widget.place,
                  date: _date,
                  items: widget.reserve.items,
                ),
              );
              if (position == SlidableButtonPosition.right) {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
    );
  }
}
