import 'package:flutter/material.dart';


class MenuItems {
  final String iconTitle;
  final String title;
  final IconData icon;

  const MenuItems(
      {required this.iconTitle,
      required this.icon,
      required this.title});
}

const appMenuItems = <MenuItems>[
  MenuItems(
      iconTitle: 'Products',
      icon: Icons.medication, 
      title: 'Available Medications'),
  MenuItems(
      iconTitle: 'Shop',
      icon: Icons.shopping_cart, 
      title: 'List Of The Products')
];
