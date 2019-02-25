import 'package:flutter/material.dart';
import 'package:lab01/ui/post.dart';

class ListViewPosts extends StatelessWidget {
  final List<Post> posts;

  ListViewPosts({Key key, this.posts}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ListView.builder(
          itemCount: posts.length,
          padding: const EdgeInsets.all(15.0),
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                Divider(
                  height: 5.0,
                ),
                ListTile(
                  title: Text(this.posts.elementAt(index).title),
                  subtitle: Text(this.posts.elementAt(index).body),
                  onTap: (){
                    print("tab on ${this.posts.elementAt(index).id}");
                  },
                )
              ],
            );
          }),
    );
  }
}
