import 'package:flutter/material.dart';

import '../../../domain/entities/pills.dart';

void openDialog(BuildContext context, PillItems pillItem) {
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: Text(
          pillItem.name,
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
          ),
        content: Text(
          pillItem.description
        ),
      )
    );
}