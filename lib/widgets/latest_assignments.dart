import 'package:agus/model/latest_announcements_model.dart';
import 'package:flutter/material.dart';
class LatestAssignments extends StatelessWidget {
  const LatestAssignments({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: LatestAnnouncementsModel.latestAnnouncements.length,
        itemBuilder: (context, index){
          return ListTile();
        },
      ),
    );
  }
}
