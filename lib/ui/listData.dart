import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';
import './post.dart';
import './ListViewPosts.dart';



class loadData extends StatelessWidget{
  Future<List<Post>> loadPost() async{
    Response resp = await get('https://jsonplaceholder.typicode.com/posts');
    // http.Response resp = await http.get('https://jsonplaceholder.typicode.com/posts');
    List<dynamic> data = json.decode(resp.body);
    List<Post> posts = List();

    data.forEach((d){
      posts.add(Post.fromJson(d));
    });
    print(posts.length);
    print(posts.elementAt(0).title);
    return posts;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Json test'),
      ),
      body: FutureBuilder(
        future: loadPost(),
        builder: (BuildContext context, AsyncSnapshot snapshort){
          if (snapshort.hasError) print("load data error");
          return snapshort.hasData ? ListViewPosts(posts: snapshort.data): Center (child: CircularProgressIndicator(),);
        },
      )
    );
  }
  
}
