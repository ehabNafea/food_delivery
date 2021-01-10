import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/data/data.dart';
import 'package:food_delivery/models/order.dart';

import '../constants.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  _buildOrderItem(Order order) {
    return Container(
      height: 145.0,
      margin: EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 140.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(order.food.imageUrl),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(15.0)),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.food.name,
                          style: kOrderTextStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          order.restaurant.name,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 7.0,
                        ),
                        Container(
                          width: 100.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(
                                  width: 0.8, color: Colors.black54)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '-',
                                style: kOrderButtonStyle,
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Text(
                                order.quantity.toString(),
                                style: kOrderTextStyle,
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Text(
                                '+',
                                style: kOrderButtonStyle,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.all(10.0),
              child: Text(
                '\$${order.quantity * order.food.price}',
                style: kItemPriceStyle,
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double totalprice = 0;
    currentUser.cart.forEach((item) {
      totalprice += item.quantity * item.food.price;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart (${currentUser.cart.length})',
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: currentUser.orders.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index < currentUser.cart.length) {
            Order order = currentUser.orders[index];
            return _buildOrderItem(order);
          }
          return Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Estimated Delivery Time: ',
                      style: kTotalPrice,
                    ),
                    Text(
                      '25min',
                      style: kTotalPrice,
                    )
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Price:',
                      style: kTotalPrice,
                    ),
                    Text(
                      '\$${totalprice.toStringAsFixed(2)}',
                      style: kTotalPrice.copyWith(color: Colors.green[700]),
                    )
                  ],
                ),
                SizedBox(
                  height: 85.0,
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 1.0,
            color: Colors.grey,
          );
        },
      ),
      bottomSheet: Container(
        height: 90.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6.0, offset: Offset(0, -1))
            ]),
        child: Center(
          child: FlatButton(onPressed: () {}, child: Text(
            'CHECKOUT',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
            ),
          ),),
        ),
      ),
    );
  }
}
