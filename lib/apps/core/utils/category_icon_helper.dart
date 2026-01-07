import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class CategoryIconHelper {
  static IconData getIcon(String iconName) {
    switch (iconName) {
      case 'fast_food':
        return FontAwesome.burger_solid;
      case 'car':
        return FontAwesome.car_solid;
      case 'cart':
        return FontAwesome.cart_shopping_solid;
      case 'receipt':
        return FontAwesome.receipt_solid;
      case 'laptop':
        return FontAwesome.laptop_solid;
      case 'movie':
        return FontAwesome.film_solid;
      case 'medkit':
        return FontAwesome.kit_medical_solid;
      case 'gift':
        return FontAwesome.gift_solid;
      case 'bag':
        return FontAwesome.bag_shopping_solid;
      case 'cash':
        return FontAwesome.money_bill_solid;
      case 'school':
        return FontAwesome.school_solid;
      case 'trending_up':
        return FontAwesome.arrow_trend_up_solid;
      default:
        return FontAwesome.circle_question_solid;
    }
  }
}
