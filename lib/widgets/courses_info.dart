import 'package:agus/model/assignments_model.dart';
import 'package:agus/model/course_into_model.dart';
import 'package:agus/model/files_model.dart';
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
        foregroundColor: Colors.cyan,
      ),
      body: Stack(
        children: [
          progressBar ? Center(
            child: CircularProgressIndicator(
              color: Colors.blue,

            ),
          ): Container(),
          Column(
            children: [
              ListTile(
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


            ],
          ),


        ],
      ),
    );
  }
}
