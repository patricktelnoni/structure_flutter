import 'package:flutter/material.dart';
import 'package:structure_flutter/formpage.dart';
import 'package:structure_flutter/main.dart';
import 'package:structure_flutter/secondpage.dart';

class BottomNavigationMenu extends StatefulWidget{
  const BottomNavigationMenu({super.key});

  @override
  BottomNavigationState createState() {
    // TODO: implement createState
    return BottomNavigationState();
  }
}

class BottomNavigationState extends State<BottomNavigationMenu>{
  int _selectedIndex = 0;
  void changePage(int index){
    setState(()=> _selectedIndex = index );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo),
            label: "Photo",
            backgroundColor: Colors.yellow,
          ),
        ],
      currentIndex: _selectedIndex,
      onTap: changePage,
      );
  }
}


