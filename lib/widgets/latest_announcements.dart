import 'package:agus/model/latest_announcements_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class LatestAnnouncements extends StatelessWidget {
  const LatestAnnouncements({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: context.watch<LatestAnnouncementsModel>().finished ? ListView.builder(
        itemCount: context.watch<LatestAnnouncementsModel>().latestAnnouncements.length,
        itemBuilder: (context, index){
          return ListTile(

          );
        },
      ) : Center(child: CircularProgressIndicator(),),
    ) ;
  }
}
