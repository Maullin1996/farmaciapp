import 'package:flutter/material.dart';

class PopUpMenuCustom extends StatelessWidget {
  const PopUpMenuCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      position: PopupMenuPosition.under,
      padding: EdgeInsets.only(right: 15),
      icon: Icon(Icons.more_vert_rounded, color: Colors.white, size: 30,),
      onSelected: (value) {
        if (value == 1) {
          print("Opcion 1");
        } else if (value == 2){
          print("Opcion 2");
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem<int>(value: 1, child: Text('Sign in')),
        PopupMenuItem<int>(value: 2, child: Text('Sign up'))
      ],
    );
  }
}
