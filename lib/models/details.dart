import 'package:flutter/material.dart';
class details{

  final String name;
  final int price;
  final int old_price;
  final String amount;
  final bool wishlist;
  final double ratings;
  final  String picture;
  final  String description;
  final  String brand;

  details(this.name, this.price, this.old_price, this.amount, this.wishlist,
      this.ratings, this.picture, this.description, this.brand);
}