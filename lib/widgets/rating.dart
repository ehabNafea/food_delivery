import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  final int rating;
  Rating({this.rating});

  @override
  Widget build(BuildContext context) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐  ';
    }
    stars.trim();
    return Text(
      stars,
      style: TextStyle(
      fontSize: 18.0,
    ),);
  }
}
