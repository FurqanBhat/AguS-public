import 'package:agus/model/announcements_model.dart';
import 'package:flutter/material.dart';
class Announcements extends StatelessWidget {
  const Announcements({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Announcements'),
      ),
      body: ListView.builder(
        itemCount: AnnouncementsModel.announcements.length,
        itemBuilder: (context, index){
          return ListTile();
        },
      ),
    );
  }
}
