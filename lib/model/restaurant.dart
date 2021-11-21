import 'package:mae/model/menu.dart';
import 'package:mae/model/place.dart';

class Restaurant extends Place {
  final Menu menu;
  
  Restaurant({
    required name,
    required imageAsset,
    required distance,
    required likeRate,
    required this.menu,
  }) : super(
          name: name,
          imageAsset: imageAsset,
          distance: distance,
          likeRate: likeRate,
        );
}
