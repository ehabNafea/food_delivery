import 'package:food_delivery/models/food.dart';

class Restaurant {
  final String imageUrl;
  final String name;
  final String address;
  final int rating;
  final List<Food> menu;

  Restaurant({
    this.name,
    this.imageUrl,
    this.address,
    this.menu,
    this.rating,
  });
}
