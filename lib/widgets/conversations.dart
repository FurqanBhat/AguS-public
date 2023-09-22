import 'dart:convert';

import 'package:agus/model/conversations_model.dart';
import 'package:agus/model/login_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
class Conversations extends StatefulWidget {
  const Conversations({super.key});

  @override
  State<Conversations> createState() => _ConversationsState();
}

class _ConversationsState extends State<Conversations>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Conversations"),
      ),
      body: ListView.builder(
        itemCount: ConversationsModel.conversations.length,
        itemBuilder: (context, index){
          return Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: ListTile(
              title: Text(ConversationsModel.conversations[index]["subject"]),
              titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              leading: Icon(Icons.message, color: Colors.blueGrey[400],),
              subtitle: Text(ConversationsModel.conversations[index]["last_message"]),
              subtitleTextStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              trailing: IconButton(
                onPressed: (){
                  showDialog(
                      context: context,
                      builder: (context){
                        return Center(
                          child: Container(
                            padding: EdgeInsets.all(30),
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.blueGrey[900]
                            ),
                            child: Text("Last Message: " + ConversationsModel.conversations[index]["last_authored_message"],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white
                            ),
                            ),
                          ),
                        );
                      },
                  );
                },
                icon: Icon(Icons.info_sharp, color: Colors.blue[500],),
              ),
            ),
          );
        },
      ),
    );
  }
}
