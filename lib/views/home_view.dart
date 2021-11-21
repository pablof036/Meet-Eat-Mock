import 'package:flutter/material.dart';
import 'package:mae/app_data.dart';
import 'package:mae/pages/details.dart';
import 'package:mae/views/details_view.dart';
import 'package:mae/widgets/place_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: const Text(
                "Cerca de ti",
                style: categoryTextStyle,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 248,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  PlaceCard(
                    place: places[0],
                    promoted: true,
                  ),
                  PlaceCard(
                    place: places[1],
                  ),
                  PlaceCard(
                    place: places[2],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                "Populares",
                style: categoryTextStyle,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 248,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  PlaceCard(
                    place: places[3],
                  ),
                  PlaceCard(
                    place: places[4],
                  ),
                  PlaceCard(
                    place: places[5],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                "Restaurantes Nuevos",
                style: categoryTextStyle,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 248,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  PlaceCard(
                    place: places[6],
                  ),
                  PlaceCard(
                    place: places[7],
                  ),
                  PlaceCard(
                    place: places[8],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                "Discotecas",
                style: categoryTextStyle,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 248,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  PlaceCard(
                    place: places[9],
                  ),
                  PlaceCard(
                    place: places[10],
                  ),
                  PlaceCard(
                    place: places[11],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
