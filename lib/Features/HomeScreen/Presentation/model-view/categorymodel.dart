import 'package:flutter/material.dart';

class CustomCategory{
  final Color color1;
  final Color color2;
  final String name;
  final IconData icon;
  CustomCategory({
    required this.color2,
    required this.color1,
    required this.name,
    required this.icon,
  });
  static List<CustomCategory> customcateglist=[
    CustomCategory(icon: Icons.person,name: "Personal",color2: Colors.white, color1: Colors.blueGrey),
    CustomCategory(name: "Learning",icon: Icons.book,color2: Colors.pinkAccent, color1: Colors.deepPurple),
    CustomCategory(icon: Icons.work,name: "Work",color2: Colors.green, color1: Colors.blue),
    CustomCategory(icon: Icons.shopping_bag,name: "Shopping",color2: Colors.deepOrange, color1:  Colors.orange),
  ];
}