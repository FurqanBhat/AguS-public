import 'package:agus/model/latest_announcements_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../model/latest_assignments_model.dart';
class LatestAssignments extends StatelessWidget {
  const LatestAssignments({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LatestAssignmentsModel>(
      builder: (context, latestAssignmentModel, child){
        return latestAssignmentModel.finished ?
        latestAssignmentModel.latestAssignments.isEmpty ?
            Container(
              padding: EdgeInsets.all(20),
              child: Text('No new assignments.', textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
              ),
            ) : Container(
                  child: ListView.builder(
                  itemCount: latestAssignmentModel.latestAssignments.length,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        title: Text(latestAssignmentModel.latestAssignments[index]["name"],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            )
                        ),
                        subtitle: Container(
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Html(
                            data: latestAssignmentModel.latestAssignments[index]["description"],
                          ),
                        ),
                      ),
                    );
                  },
                ),
            ):
        Center(child: CircularProgressIndicator());
      },

    );

  }
}
