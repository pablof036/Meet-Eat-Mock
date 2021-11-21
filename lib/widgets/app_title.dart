import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  const AppTitle(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          color: Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
        children: [
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Container(
              padding: const EdgeInsets.only(
                right: 8,
              ),
              height: 54,
              child: Image.asset('assets/icon.png'),
            ),
          ),
          TextSpan(text: title),
        ],
      ),
    );
  }
}
