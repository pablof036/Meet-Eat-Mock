import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mae/app_data.dart';
import 'package:mae/bloc/reserve.dart';
import 'package:mae/model/place.dart';
import 'package:mae/model/reserve.dart';
import 'package:mae/pages/reserve.dart';
import 'package:mae/views/details_view.dart';
import 'package:palette_generator/palette_generator.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key, required this.place}) : super(key: key);

  final Place place;

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ReserveCubit>(context).clear();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getDominantColor(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Scaffold(
          backgroundColor: Colors.grey.shade100,
          floatingActionButton: BlocBuilder<ReserveCubit, Reserve>(
            builder: (context, reserve) {
              return FloatingActionButton.extended(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ReservePage(reserve, widget.place),
                    ),
                  );
                },
                backgroundColor: fabColor,
                label: (reserve.items.isNotEmpty)
                    ? Text("Reservar (${reserve.items.length})")
                    : const Text("Reservar"),
                icon: const Icon(
                  Icons.shopping_cart,
                ),
              );
            },
          ),
          body: CustomScrollView(
            slivers: [
              SliverLayoutBuilder(
                builder: (context, constraints) {
                  return SliverAppBar(
                    pinned: true,
                    backgroundColor: snapshot.data as Color?,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text(
                        widget.place.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: Colors.black,
                              blurRadius:
                                  (constraints.scrollOffset == 0) ? 20 : 0,
                            ),
                          ],
                        ),
                      ),
                      background: ColorFiltered(
                        colorFilter: const ColorFilter.mode(
                          Colors.black26,
                          BlendMode.darken,
                        ),
                        child: Image.asset(
                          widget.place.imageAsset,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    expandedHeight: 220,
                  );
                },
              ),
              SliverToBoxAdapter(
                child: DetailsView(widget.place),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<Color?> getDominantColor() async {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(
      AssetImage(widget.place.imageAsset),
    );
    final color = paletteGenerator.mutedColor;

    return (color == null) ? Colors.amber.shade600 : color.color;
  }
}
