import 'package:agus/model/discussions_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
class Discussions extends StatelessWidget {
  const Discussions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Discussions"),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: DiscussionModel.discussions.length,
          itemBuilder: (context, index){
            return ListTile(
              titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              subtitleTextStyle: TextStyle(fontWeight: FontWeight.w500),
              leading: Icon(Icons.people_outline, color: Colors.blueGrey[400],),
              title: Text(DiscussionModel.discussions[index]['title']),
              subtitle:Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Html(
                  data: DiscussionModel.discussions[index]['message']),
              ),
            );
          },
        ),

      ),
    );
  }
}

