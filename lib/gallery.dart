import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:http/http.dart' as http;

Future<List<Photo>> fetchPhotos() async{

  String apiKey = 'FTdevJlo4dYwPBS8gbHSR5yHzP9gYiHPsfqVqQjXAdMQKjmG0tP8R8fv';
  //String url      = 'https://jsonplaceholder.typicode.com/posts';
  String url    = 'https://api.pexels.com/v1/curated?page=2&per_page=40';

  //String url      = 'https://jsonplaceholder.typicode.com/photos';
  final response  = await http.get(
      Uri.parse(url),
      headers: {
        HttpHeaders.authorizationHeader: apiKey,
      },
  );
  List<Photo> photoData = [];

  if (response.statusCode == 200) {
    final list = jsonDecode(response.body);
    for (var json in list['photos']) {
      //log(json['src']['original']);
      photoData.add(Photo.fromJson(json));
    }
    return photoData;
  }
  else{
    throw Exception('Failed to load posts');
  }
}

class Photo{
  final int? albumid;
  final int? id;
  final String? title;
  final String url;
  final String? thumbnailUrl;

  const Photo({
    required this.albumid,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl
  });

  static Photo fromJson(json)=> Photo(
      albumid       : json['albumId'],
      id            : json['id'],
      title         : json['title'],
      url           : json['src']['landscape'],
      thumbnailUrl  : json['src']['tiny']
  );
}

class Gallery extends StatefulWidget{
  const Gallery({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GalleryState();
  }
}

class GalleryState extends State<Gallery>{
  List<Photo> photos =  [];

  void getData() async{
    photos = await fetchPhotos();
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
    return
        Container(child:
          PhotoViewGallery.builder(
              itemCount: photos.length,
              builder: (context, index){
                return PhotoViewGalleryPageOptions(
                  imageProvider: NetworkImage(photos[index].url,),
                  minScale: PhotoViewComputedScale.contained * 0.8,
                  maxScale: PhotoViewComputedScale.covered * 2,
                );
              },
              scrollPhysics: BouncingScrollPhysics(),
              backgroundDecoration: BoxDecoration(
                borderRadius:BorderRadius.all(Radius.circular(20)),
                color: Theme.of(context).canvasColor,
              ),
              enableRotation:true,
              loadingBuilder: (context, event) => Center(
                child: Container(
                  width: 30.0,
                  height: 30.0,
                  child: CircularProgressIndicator(
                    backgroundColor:Colors.black45,
                  ),
                ),
              ),
            )

    );

  }
}



