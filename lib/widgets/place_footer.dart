import 'package:flutter/material.dart';
import 'package:mae/model/place.dart';

class PlaceFooter extends StatelessWidget {
  const PlaceFooter(this.place, {Key? key}) : super(key: key);

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RichText(
            text: TextSpan(
              style: const TextStyle(
                color: Colors.black,
              ),
              children: [
                WidgetSpan(
                  child: Container(
                    padding: EdgeInsets.only(right: 2),
                    child: Icon(
                      Icons.place,
                      size: 21,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  alignment: PlaceholderAlignment.middle,
                ),
                TextSpan(text: place.distance)
              ],
            ),
          ),
        ),
        RichText(
          text: TextSpan(
            style: const TextStyle(
              color: Colors.black,
            ),
            children: [
              WidgetSpan(
                child: Container(
                  padding: EdgeInsets.only(right: 2),
                  child: Icon(
                    Icons.thumb_up,
                    size: 21,
                    color: Colors.grey.shade800,
                  ),
                ),
                alignment: PlaceholderAlignment.middle,
              ),
              TextSpan(text: "${place.likeRate * 100}%")
            ],
          ),
        ),
      ],
    );
  }
}
