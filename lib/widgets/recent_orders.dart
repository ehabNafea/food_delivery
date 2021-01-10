import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/data/data.dart';
import 'package:food_delivery/models/order.dart';

class RecentOrders extends StatelessWidget {
  _buildRecentOrder(BuildContext context, Order order) {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: 320.0,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(color: Colors.grey[200], width: 1.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image(
              image: AssetImage(order.food.imageUrl),
              height: 100.0,
              width: 100.0,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    order.food.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 3.0,
                  ),
                  Text(
                    order.restaurant.name,
                    style: kTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 3.0,
                  ),
                  Text(
                    order.date,
                    style: kTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 20.0),
            width: 48.0,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(50.0)),
            child: IconButton(
              icon: Icon(Icons.add),
              iconSize: 30.0,
              color: Colors.white,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Recent Order',
            style: kTitle
          ),
        ),
        Container(
          height: 120.0,
          margin: EdgeInsets.only(left: 10.0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemCount: currentUser.orders.length,
            itemBuilder: (BuildContext context, int index) {
              Order order = currentUser.orders[index];
              return _buildRecentOrder(context, order);
            },
          ),
        ),
      ],
    );
  }
}
