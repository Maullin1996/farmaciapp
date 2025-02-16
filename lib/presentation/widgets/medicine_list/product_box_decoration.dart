import 'package:flutter/material.dart';

import '../../../domain/entities/pills.dart';

class ProductBoxDecoration extends StatelessWidget {
  const ProductBoxDecoration({
    super.key,
    required this.isSelected,
    required this.pillItem,
  });

  final bool isSelected;
  final PillItems pillItem;

  @override
  Widget build(BuildContext context) {
    Color selectedItem = Color.fromRGBO(211, 211, 211, 1);
    Color deselectedItem = Color.fromRGBO(241, 240, 242, 1);
    return Container(
      padding: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(4, 4))
        ],
        borderRadius: BorderRadius.circular(30),
        color: !isSelected ? deselectedItem : selectedItem,
      ),
      child: Stack(
        children: [
          Center(
            child: Image(
              image: NetworkImage(pillItem.image),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                pillItem.name,
                style: TextStyle(fontSize: 14),
              ))
        ],
      ),
    );
  }
}
