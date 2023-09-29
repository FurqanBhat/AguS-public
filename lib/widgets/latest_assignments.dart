import 'package:agus/model/latest_announcements_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/latest_assignments_model.dart';
class LatestAssignments extends StatelessWidget {
  const LatestAssignments({super.key});

  @override
  Widget build(BuildContext context) {
    return context.watch<LatestAssignmentsModel>().finished ?
    Container(
      child: ListView.builder(
        itemCount: context.watch<LatestAssignmentsModel>().latestAssignments.length,
        itemBuilder: (context, index){
          return ListTile();
        },
      ),
    ):
        Center(child: CircularProgressIndicator());
  }
}
