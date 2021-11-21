import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mae/model/place.dart';
import 'package:mae/pages/details.dart';
import 'package:mae/widgets/place_footer.dart';

class PlaceCard extends StatefulWidget {
  const PlaceCard({Key? key, required this.place, this.promoted = false})
      : super(key: key);

  final Place place;
  final bool promoted;

  @override
  _PlaceCardState createState() => _PlaceCardState();
}

class _PlaceCardState extends State<PlaceCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: min(MediaQuery.of(context).size.width * 0.75, 450),
      child: Stack(
        children: [
          Card(
            semanticContainer: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        widget.place.imageAsset,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.25),
                        ),
                      ),
                      if (widget.promoted)
                        Container(
                          alignment: Alignment.topLeft,
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.amber.shade300.withOpacity(0.75),
                            ),
                            child: Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      color: Colors.grey.shade900,
                                    ),
                                    children: [
                                      WidgetSpan(
                                        child: Container(
                                          padding:
                                              const EdgeInsets.only(right: 2),
                                          child: Icon(
                                            Icons.star,
                                            size: 21,
                                            color: Colors.grey.shade900,
                                          ),
                                        ),
                                        alignment: PlaceholderAlignment.middle,
                                      ),
                                      const TextSpan(text: "Promocionado")
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          widget.place.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            shadows: [
                              Shadow(color: Colors.black, blurRadius: 20),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(14),
                    child: PlaceFooter(widget.place)),
              ],
            ),
          ),
          Positioned.fill(
            child: Material(
              type: MaterialType.transparency,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(4),
                  ),
                ),
                padding: const EdgeInsets.all(4),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return DetailsPage(place: widget.place);
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
