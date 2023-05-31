import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class SecondLayout extends StatelessWidget{
  final List<String> data;
  //final String kiriman;
  const SecondLayout({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(data[0]),
      ),
      body: Container(
        child:
          Center(
            child: PhotoView(
              imageProvider: AssetImage('assets/images/pink-beach.jpeg'),
            ),
          ),
      ),
      //bottomNavigationBar:  BottomNavigationMenu(),
    );
  }
}