import 'package:flutter/material.dart';
import 'package:state_management_exercise/config/routes/app_routes.dart';

class MenuItems {
  final String iconTitle;
  final String title;
  final dynamic link;
  final IconData icon;

  const MenuItems(
      {required this.iconTitle,
      required this.link,
      required this.icon,
      required this.title});
}

const appMenuItems = <MenuItems>[
  MenuItems(
      iconTitle: 'Products',
      link: AppRoutes.medicine,
      icon: Icons.medication, 
      title: 'Available Medications'),
  MenuItems(
      iconTitle: 'Shop',
      link: AppRoutes.medicineList,
      icon: Icons.shopping_cart, 
      title: 'List Of The Products')
];
