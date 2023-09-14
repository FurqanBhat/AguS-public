import 'package:agus/model/conversations_model.dart';
import 'package:flutter/material.dart';
class Announcements extends StatelessWidget {
  const Announcements({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Announcements'),
        foregroundColor: Colors.cyan,
      ),
      body: ListView.builder(
        itemCount: ConversationsModel.conversations.length,
        itemBuilder: (context, index){
          return ListTile();
        },
      ),
    );
  }
}
