import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';

Future<List<GalleryItem>> fetchPhotos() async{

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
  List<GalleryItem> photoData = [];

  if (response.statusCode == 200) {
    final list = jsonDecode(response.body);
    for (var json in list['photos']) {
      //log(json['src']['original']);
      photoData.add(GalleryItem.fromJson(json));
    }
    return photoData;
  }
  else{
    throw Exception('Failed to load posts');
  }
}

class GalleryItem {
  GalleryItem({
    required this.thumbnailUrl,
    required this.fullUrl,
    required this.id
  });

  final String thumbnailUrl;
  final String fullUrl;
  final int id;

  static GalleryItem fromJson(json)=> GalleryItem(
      id            : json['id'],
      fullUrl       : json['src']['medium'],
      thumbnailUrl  : json['src']['tiny']
  );
}

class GalleryItemThumbnail extends StatelessWidget {
  const GalleryItemThumbnail({
    Key? key,
    required this.galleryItem,
    required this.onTap,
  }) : super(key: key);

  final GalleryItem galleryItem;

  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: GestureDetector(
        onTap: onTap,
        child: Hero(
          tag: galleryItem.id,
          child: Image.asset(galleryItem.thumbnailUrl, height: 80.0),
        ),
      ),
    );
  }
}
/*
List<GalleryItem> galleryItems = <GalleryItem>[
  GalleryItem(
    id: "tag1",
    fullUrl: "assets/gallery1.jpg",
  ),
  GalleryItem(id: "tag2", resource: "assets/firefox.svg"),
  GalleryItem(
    id: "tag3",
    resource: "assets/gallery2.jpg",
  ),
  GalleryItem(
    id: "tag4",
    resource: "assets/gallery3.jpg",
  ),
];*/