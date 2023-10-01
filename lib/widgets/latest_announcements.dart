import 'package:agus/model/latest_announcements_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class LatestAnnouncements extends StatelessWidget {
  const LatestAnnouncements({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Consumer<LatestAnnouncementsModel>(
          builder: (context, latestAnnouncementsModel, child) {
            return latestAnnouncementsModel.finished ?
            latestAnnouncementsModel.latestAnnouncements.isEmpty ?
            Container(
              child: Text("No new announcements.", textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),), padding: EdgeInsets.all(20),
            ) : ListView.builder(
              itemCount: latestAnnouncementsModel.latestAnnouncements.length,
              itemBuilder: (context, index){
                return ListTile(
                  title: Text("full"),

                );
              },
            ) : Center(child: CircularProgressIndicator(),
            ) ;


          },

        )
    );
  }
}


    //     context.watch<LatestAnnouncementsModel>().finished ? ListView.builder(
    //     itemCount: context.watch<LatestAnnouncementsModel>().latestAnnouncements.length,
    //     itemBuilder: (context, index){
    //       return context.watch<LatestAnnouncementsModel>().latestAnnouncements.isEmpty ? Text("No new announcements")
    //           :  ListTile(
    //
    //       );
    //     },
    //   ) : Center(child: CircularProgressIndicator(),),
    // ) ;
  // }
// }
