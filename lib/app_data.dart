import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mae/model/menu.dart';
import 'package:mae/model/menu_item.dart';
import 'package:mae/model/menu_section.dart';
import 'package:mae/model/order.dart';
import 'package:mae/model/place.dart';
import 'package:mae/model/restaurant.dart';

Color fabColor = Colors.amber.shade600;

const categoryTextStyle = TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 18,
);

const titleTextStyle = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.w600,
);

final List<Place> places = [
  const Place(
    name: 'Pomodoro',
    imageAsset: 'assets/pomodoro.jpg',
    distance: "200m",
    likeRate: 0.9,
  ),
  const Place(
    name: '100 montaditos',
    imageAsset: 'assets/100montaditos.webp',
    distance: "800m",
    likeRate: 0.8,
  ),
  const Place(
    name: 'Tasty Poke',
    imageAsset: 'assets/tastypoke.webp',
    distance: "900m",
    likeRate: 0.85,
  ),
  Restaurant(
    name: 'La boca te lia',
    imageAsset: 'assets/labocatelia.webp',
    distance: "1.5km",
    likeRate: 0.85,
    menu: Menu(
      sections: [
        MenuSection(
          title: "Popular",
          items: [
            menuItems[0],
            menuItems[2],
          ],
        ),
        MenuSection(
          title: "Entrantes",
          items: menuItems.getRange(0, 2).toList(),
        ),
        MenuSection(
          title: "Bocadillos",
          items: menuItems.getRange(2, 7).toList(),
        ),
        MenuSection(
          title: "Hamburguesas",
          items: menuItems.getRange(7, 10).toList(),
        ),
      ],
    ),
  ),
  const Place(
    name: 'Goiko',
    imageAsset: 'assets/goiko.webp',
    distance: "850m",
    likeRate: 0.8,
  ),
  const Place(
    name: 'Domino\'s Pizza',
    imageAsset: 'assets/dominos.webp',
    distance: "1.2km",
    likeRate: 0.7,
  ),
  const Place(
    name: 'Bendito Burrito',
    imageAsset: 'assets/benditoburrito.webp',
    distance: "800m",
    likeRate: 0.8,
  ),
  const Place(
    name: 'Foster\'s Hollywood',
    imageAsset: 'assets/fosters.webp',
    distance: "12km",
    likeRate: 0.75,
  ),
  const Place(
    name: 'Tasty Poke',
    imageAsset: 'assets/tastypoke.webp',
    distance: "500m",
    likeRate: 0.9,
  ),
  const Place(
    name: 'Maná',
    imageAsset: 'assets/mana.jpg',
    distance: "800m",
    likeRate: 0.8,
  ),
  const Place(
    name: 'Gurú',
    imageAsset: 'assets/guru.png',
    distance: "800m",
    likeRate: 0.8,
  ),
  const Place(
    name: 'Metro',
    imageAsset: 'assets/metro.jpg',
    distance: "800m",
    likeRate: 0.8,
  ),
];

const menuItems = [
  MenuItem(
    name: "Cheese Bacon",
    imageAsset: 'assets/cheesebacon.webp',
    price: 5.89,
  ),
  MenuItem(
    name: "Raquetas",
    imageAsset: 'assets/raquetas.jpg',
    price: 4.9,
  ),
  MenuItem(
    name: "Condestable",
    imageAsset: 'assets/condestable.webp',
    price: 4.9,
  ),
  MenuItem(
    name: "Paloma",
    imageAsset: 'assets/paloma.webp',
    price: 3.7,
  ),
  MenuItem(
    name: "Salzillo",
    imageAsset: 'assets/salzillo.webp',
    price: 4.9,
  ),
  MenuItem(
    name: "University",
    imageAsset: 'assets/university.webp',
    price: 4.9,
  ),
  MenuItem(
    name: "San Pedro",
    imageAsset: 'assets/sanpedro.webp',
    price: 4.9,
  ),
  MenuItem(
    name: "Castellana",
    imageAsset: 'assets/castellana.jpg',
    price: 4.9,
  ),
  MenuItem(
    name: "London",
    imageAsset: 'assets/london.webp',
    price: 4.9,
  ),
  MenuItem(
    name: "Las Vegas",
    imageAsset: 'assets/lasvegas.webp',
    price: 4.9,
  ),
  MenuItem(
    name: "Hollywood",
    imageAsset: 'assets/hollywood.webp',
    price: 4.9,
  ),
];

final ongoingOrder = Order(
  place: places[3],
  date: DateTime.now(),
  items: [
    menuItems[0],
    menuItems[2],
    menuItems[2],
    menuItems[3],
    menuItems[4],
    menuItems[6],
  ],
);

final scheduledOrders = [
  Order(
    place: places[5],
    date: DateTime.parse("2021-11-25 20:00:00"),
    items: [],
  ),
  Order(
    place: places[9],
    date: DateTime.parse("2021-11-25 23:00:00"),
    items: [],
  )
];

final finishedOrders = [
  Order(
    place: places[0],
    date: DateTime.parse("2021-11-08 19:30:00"),
    items: [],
  ),
  Order(
    place: places[1],
    date: DateTime.parse("2021-11-05 14:30:00"),
    items: [],
  ),
  Order(
    place: places[4],
    date: DateTime.parse("2021-10-25 21:00:00"),
    items: [],
  ),
];
