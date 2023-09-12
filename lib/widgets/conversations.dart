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
        foregroundColor: Colors.cyan,
      ),
      body: ListView.builder(
        itemCount: ConversationsModel.conversations.length,
        itemBuilder: (context, index){
          return Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: ListTile(
              title: Text(ConversationsModel.conversations[index]["subject"]),
              leading: Icon(Icons.message, color: Colors.blue,),
              subtitle: Text(ConversationsModel.conversations[index]["last_message"]),
            ),
          );
        },
      ),
    );
  }
}
