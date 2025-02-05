import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:state_management_exercise/config/menu/menu_items.dart';
import 'package:state_management_exercise/infraestructure/services/auth_service.dart';
import 'package:state_management_exercise/presentation/views/medicine_list_screen.dart';
import 'package:state_management_exercise/presentation/views/medicine_screen.dart';
import 'package:state_management_exercise/presentation/widgets/widgets.dart';
import 'package:weinds/tokens/colors.dart';

class HomeScreen extends StatefulWidget {
  static const name = 'home_screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final screens = [const MedicineListScreen(), const MedicineScreen()];
    return SafeArea(
      top: true,
      bottom: true,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            PopUpMenuCustom()     
          ],
          toolbarHeight: 80,
          backgroundColor: WeinDsColors.strongPrimary,
          title: Text(
            appMenuItems[selectedIndex].title,
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.white,
        body: screens[selectedIndex], //_HomeView(),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: WeinDsColors.strongPrimary,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            currentIndex: selectedIndex,
            onTap: (newIndex) {
              setState(() {
                selectedIndex = newIndex;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(appMenuItems[0].icon),
                label: appMenuItems[0].iconTitle,
              ),
              BottomNavigationBarItem(
                icon: Icon(appMenuItems[1].icon),
                label: appMenuItems[1].iconTitle,
              )
            ]),
      ),
    );
  }
}
