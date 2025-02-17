import 'package:flutter/material.dart'; // Importing Flutter material package for UI components

import '../../../domain/entities/pills.dart'; // Importing custom pill items entity

// A stateless widget that builds a product box decoration
class ProductBoxDecoration extends StatelessWidget {
  const ProductBoxDecoration({
    super.key,
    required this.isSelected,
    required this.pillItem,
  });

  final bool isSelected; // Whether the item is selected
  final PillItems pillItem; // The pill item to be displayed

  @override
  Widget build(BuildContext context) {
    Color selectedItem = Color.fromRGBO(211, 211, 211, 1); // Color for selected item
    Color deselectedItem = Color.fromRGBO(241, 240, 242, 1); // Color for deselected item
    return Container(
      padding: EdgeInsets.only(bottom: 8), // Padding at the bottom
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black.withAlpha(77), // Shadow color with 30% opacity
              spreadRadius: 2, // Spread radius of the shadow
              blurRadius: 5, // Blur radius of the shadow
              offset: Offset(4, 4)) // Offset of the shadow
        ],
        borderRadius: BorderRadius.circular(30), // Rounded corners with a radius of 30
        color: !isSelected ? deselectedItem : selectedItem, // Background color based on selection
      ),
      child: Stack(
        children: [
          Center(
            child: Image(
              image: NetworkImage(pillItem.image), // Displaying the pill item image from network
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter, // Aligning the text at the bottom center
              child: Text(
                pillItem.name, // Displaying the pill item name
                style: TextStyle(fontSize: 14), // Text style with font size 14
              ))
        ],
      ),
    );
  }
}