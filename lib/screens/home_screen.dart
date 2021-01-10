import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/data/data.dart';
import 'package:food_delivery/models/resaurant.dart';
import 'package:food_delivery/screens/cart_screen.dart';
import 'package:food_delivery/screens/restaurant_screen.dart';
import 'package:food_delivery/widgets/rating.dart';
import 'package:food_delivery/widgets/recent_orders.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();

  clearSearch() {
    searchController.clear();
  }

  _buildRestaurant() {
    List<Widget> restaurantList = [];
    restaurants.forEach((Restaurant rest) {
      restaurantList.add(
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => RestaurantScreen(restaurant: rest)),
          ),
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(width: 1.0, color: Colors.grey[200]),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Hero(
                    tag: rest.imageUrl,
                    child: Image(
                      image: AssetImage(rest.imageUrl),
                      height: 150.0,
                      width: 150.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          rest.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        Rating(rating: rest.rating),
                        SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          rest.address,
                          style: kTextStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          '0.2 miles away',
                          style: kTextStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
    return Column(
      children: restaurantList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.account_circle,
            size: 30.0,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        title: Text('Food delivery'),
        centerTitle: true,
        actions: [
          FlatButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => CartScreen()),
            ),
            child: Text(
              'Cart (${currentUser.cart.length})',
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(width: 0.8)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                          width: 0.8, color: Theme.of(context).primaryColor)),
                  hintText: 'Search Food or Restaurant',
                  prefixIcon: Icon(
                    Icons.search,
                    size: 30.0,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: clearSearch,
                  )),
            ),
          ),
          RecentOrders(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Nearby Restaurant',
                  style: kTitle,
                ),
              ),
              _buildRestaurant(),
            ],
          ),
        ],
      ),
    );
  }
}
