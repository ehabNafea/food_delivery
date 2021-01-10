import 'package:food_delivery/models/food.dart';
import 'package:food_delivery/models/resaurant.dart';

class Order {
  final Restaurant restaurant;
  final Food food;
  final String date;
  final int quantity;

  Order({
    this.restaurant,
    this.date,
    this.food,
    this.quantity,
});
}
