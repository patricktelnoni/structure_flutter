import 'package:flutter/material.dart';
import 'package:structure_flutter/listview.dart';
import 'new_secondpage.dart';
import 'package:structure_flutter/formpage.dart';

//import 'bottomnav.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp>{
  int _mainIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    const appTitle = 'Form Validation Demo';
    const List<Widget> _widgetOptions = <Widget>[
      MyApp(),
      SecondLayoutNew(data: ["Hallo", "Holla"]),
      MyForm()
    ];

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        resizeToAvoidBottomInset : false,
        appBar: AppBar(
          title: const Text(appTitle),
          backgroundColor: Colors.indigo,
        ),

        body: IndexedStack(
          index: _mainIndex,
          children: const [
            MyForm(),
            SecondLayoutNew(data: ["Hallo", "Holla"]),
            DataList()
          ],
        ),
        /*body: SingleChildScrollView(
          child: const BottomNavigationMenu(),
        ),*/
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _mainIndex,
          onTap: (int newindex) {
            setState(() {
              _mainIndex = newindex;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_a_photo),
              label: "Take a photo",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Account",
            ),
          ],
        ),
      ),
    );
  }
}

