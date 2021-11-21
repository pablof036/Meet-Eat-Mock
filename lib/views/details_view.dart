import 'package:flutter/material.dart';
import 'package:mae/model/place.dart';
import 'package:mae/model/restaurant.dart';
import 'package:mae/widgets/menu_section.dart';
import 'package:mae/widgets/place_footer.dart';

class DetailsView extends StatefulWidget {
  const DetailsView(
    this.place, {
    Key? key,
  }) : super(key: key);

  final Place place;

  @override
  _DetailsViewState createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          PlaceFooter(widget.place),
          const Divider(),
          Card(
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.place is Restaurant) ...getMenuSections(),
                  if (widget.place is! Restaurant) const Text("Local"),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 64,
          ),
        ],
      ),
    );
  }

  List<Widget> getMenuSections() {
    var restaurant = widget.place as Restaurant;
    var widgets = <Widget>[];
    for (final section in restaurant.menu.sections) {
      widgets.addAll(
        [
          MenuSectionWidget(section: section),
          Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: const Divider(
              height: 1,
            ),
          ),
        ],
      );
    }
    widgets.removeLast();
    return widgets;
  }
}
