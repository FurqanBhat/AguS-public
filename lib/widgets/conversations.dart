import 'dart:convert';
import 'package:agus/main.dart';
import 'package:agus/model/conversations_model.dart';
import 'package:agus/model/login_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
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
      body: Container(
        child: ListView.builder(
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
                  onPressed: () async{
                    await ConversationsModel.getFullMessage(ConversationsModel.conversations[index]["id"]);
                    showDialog(
                        context: context,
                        builder: (context){
                          return Center(
                            child: Container(
                              padding: EdgeInsets.all(30),
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: ListView.builder(
                                itemCount: ConversationsModel.fullMessage['message_count'],
                                itemBuilder: (context, index){
                                  return Container(
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                        color: Colors.blueGrey[900],
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Column(
                                      children: [
                                        Text("Message ${ConversationsModel.fullMessage['message_count']-index}", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                                        SizedBox(height: 10,),
                                        Text(ConversationsModel.fullMessage["messages"][index]["body"],
                                          style: TextStyle(
                                              fontSize: 16
                                          ),
                                        ),
                                      ],
                                    )
                                  );
                                },

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
      ),
    );
  }
}
