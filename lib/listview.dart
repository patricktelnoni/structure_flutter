import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Post>> fetchPost() async{
  String url = 'https://jsonplaceholder.typicode.com/posts';
  final response = await http.get(Uri.parse(url));
  List<Post> postsData = [];
  //log('data: $response');
  if (response.statusCode == 200) {
    final list = jsonDecode(response.body);
    for (var json in list) {
      postsData.add(Post.fromJson(json));
    }
    return postsData;
  }
  else{
    throw Exception('Failed to load posts');
  }
}

class Post{
  final int? userid;
  final int? id;
  final String? title;
  final String? body;

  const Post({
    required this.userid,
    required this.id,
    required this.title,
    required this.body
  });

  static Post fromJson(json)=> Post(
        userid  : json['userid'],
        id      : json['id'],
        title   : json['title'],
        body    : json['body']
    );
}

class DataList extends StatefulWidget{
  const DataList({super.key});

  @override
  State<StatefulWidget> createState() {
    return DataListState();
  }
}

class DataListState extends State<DataList> {
  final List<String> names = <String>['Aby', 'Aish', 'Ayan', 'Ben', 'Bob', 'Charlie', 'Cook', 'Carline'];
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
    return ListView.builder(
      padding: const EdgeInsets.all(20.0),
      itemCount: posts.length,
      itemBuilder: (BuildContext context, int index){
          return Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black26,
                style: BorderStyle.solid,
                width: 2.0,
              ),
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(5.0),
            ),
            height: 150,
            margin: EdgeInsets.all(2),
            //color: Colors.amber[600],
            child: ListTile(
              title:Text('${posts[index].title}'),
              subtitle: Text('${posts[index].body}', ),
              leading: CircleAvatar(backgroundImage: NetworkImage("https://miro.medium.com/fit/c/64/64/1*WSdkXxKtD8m54-1xp75cqQ.jpeg")),
            )

          );
        },
    );
  }
}