import 'package:flutter/material.dart';
import 'package:js/js.dart';
import 'dart:html';
import 'package:photo_view/photo_view.dart';
import 'package:structure_flutter/gallery.dart';
import 'package:structure_flutter/listview.dart';
import 'package:structure_flutter/secondpage.dart';
import 'new_secondpage.dart';
import 'package:structure_flutter/formpage.dart';
import 'notification_service.dart';
//import 'bottomnav.dart';

NotificationService _notificationService = NotificationService();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main(){
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().init();
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

  final List<String> entries = <String>['A', 'B', 'C', 'D', 'E', 'F'];
  final List<int> colorCodes = <int>[600, 300, 100, 600, 300, 100];

  List<Post> posts =  [];

  void getData() async{
    posts = await fetchPost();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    const appTitle = 'Form Validation Demo';
    return MaterialApp(
      title: appTitle,
      navigatorKey: navigatorKey,

      home: Scaffold(
        resizeToAvoidBottomInset : false,
        appBar: AppBar(
          title: const Text(appTitle),
          backgroundColor: Colors.black45,
        ),
        body:IndexedStack(
          index: _mainIndex,
          children: const [
            MyForm(),
            SecondLayoutNew(data: ["Hallo", "Holla"]),
            DataList(),
            Gallery()
          ],
        ),

        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.black26,
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
            BottomNavigationBarItem(
              icon: Icon(Icons.photo),
              label: "Gallery",
            ),
          ],
        ),
      ),
    );
  }
}

