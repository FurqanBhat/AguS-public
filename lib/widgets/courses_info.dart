import 'package:agus/model/announcements_model.dart';
import 'package:agus/model/assignments_model.dart';
import 'package:agus/model/course_info_model.dart';
import 'package:agus/model/discussions_model.dart';
import 'package:agus/model/files_model.dart';
import 'package:agus/model/results_model.dart';
import 'package:flutter/material.dart';

import '../routes/routes.dart';
class CoursesInfo extends StatefulWidget {
  const CoursesInfo({super.key});

  @override
  State<CoursesInfo> createState() => _CoursesInfoState();
}

class _CoursesInfoState extends State<CoursesInfo> {
  bool progressBar=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Course Details"),
      ),
      body: Stack(
        children: [
          progressBar ? Center(
            child: CircularProgressIndicator(
              color: Colors.blueGrey[400],

            ),
          ): Container(),
          Column(
            children: [
              ListTile(
                leading: Icon(Icons.announcement, color: Colors.blueGrey[400],),
                title: Text("All Announcements"),
                onTap: () async{
                  setState(() {
                    progressBar=true;
                  });

                  await AnnouncementsModel.fetchAnnouncements();
                  setState(() {
                    progressBar=false;
                  });
                  Navigator.of(context).pushNamed(RouteManager.announcements);
                },
              ),
              ListTile(
                leading: Icon(Icons.file_open, color: Colors.blueGrey[400],),
                title: Text("Files"),
                onTap: () async{
                  setState(() {
                    progressBar=true;
                  });

                  await FilesModel.fetchFiles();
                  setState(() {
                    progressBar=false;
                  });
                  Navigator.of(context).pushNamed(RouteManager.filesPage);
                },
            ),
              ListTile(
                leading: Icon(Icons.assignment, color: Colors.blueGrey[400],),
                title: Text("All Assignments"),
                onTap: () async{
                  setState(() {
                    progressBar=true;
                  });
                  await AssignmentsModel.fetchAssignments();
                  setState(() {
                    progressBar=false;
                  });
                  Navigator.of(context).pushNamed(RouteManager.assignments);
                },

              ),
              ListTile(
                leading: Icon(Icons.grade, color: Colors.blueGrey[400],),
                title: Text("Grades"),
                onTap: () async{
                  setState(() {
                    progressBar=true;
                  });

                  await ResultsModel.getResults();
                  setState(() {
                    progressBar=false;
                  });
                  Navigator.of(context).pushNamed(RouteManager.results);
                },
              ),
              ListTile(
                leading: Icon(Icons.people, color: Colors.blueGrey[400],),
                title: Text("Discussions"),
                onTap: () async{
                  setState(() {
                    progressBar=true;
                  });

                  await DiscussionModel.getDiscussions();
                  setState(() {
                    progressBar=false;
                  });
                  Navigator.of(context).pushNamed(RouteManager.discussions);
                },
              ),


            ],
          ),


        ],
      ),
    );
  }
}
