import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/models/food.dart';
import 'package:food_delivery/models/resaurant.dart';
import 'package:food_delivery/widgets/rating.dart';

class RestaurantScreen extends StatefulWidget {
  final Restaurant restaurant;
  RestaurantScreen({this.restaurant});

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  _buildMenuItem(Food food) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 175.0,
              height: 175.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(food.imageUrl),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(15.0),
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.black.withOpacity(0.3),
                      Colors.black87.withOpacity(0.3),
                      Colors.black54.withOpacity(0.3),
                      Colors.black38.withOpacity(0.3),
                    ]),
              ),
            ),
            Container(
              width: 175.0,
              height: 175.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.black.withOpacity(0.3),
                      Colors.black87.withOpacity(0.3),
                      Colors.black54.withOpacity(0.3),
                      Colors.black38.withOpacity(0.3),
                    ]),
              ),
            ),
            Positioned(
              bottom: 65.0,
              child: Column(
                children: [
                  Text(food.name, style: kTextItemStyle),
                  Text(
                    '\$${food.price.toString()}',
                    style: kTextItemStyle.copyWith(fontSize: 18.0),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 10.0,
              right: 10.0,
              child: Container(
                width: 48.0,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: IconButton(
                  icon: Icon(Icons.add),
                  iconSize: 30.0,
                  color: Colors.white,
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Hero(
                  tag: widget.restaurant.imageUrl,
                  child: Image(
                    image: AssetImage(widget.restaurant.imageUrl),
                    height: 220.0,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(context),
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        iconSize: 30.0,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite,
                          color: Theme.of(context).primaryColor,
                        ),
                        iconSize: 35.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.restaurant.name,
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '0.2 Miles away',
                        style: TextStyle(fontSize: 16.0),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Rating(
                    rating: widget.restaurant.rating,
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    widget.restaurant.address,
                    style: TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  onPressed: () {},
                  child: Text(
                    'Reviews',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  color: Theme.of(context).primaryColor,
                ),
                FlatButton(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  onPressed: () {},
                  child: Text(
                    'Contact',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Center(
              child: Text(
                'Menu',
                style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: GridView.count(
                padding: EdgeInsets.all(8.0),
                crossAxisCount: 2,
                children: List.generate(widget.restaurant.menu.length, (index) {
                  Food food = widget.restaurant.menu[index];
                  return _buildMenuItem(food);
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
