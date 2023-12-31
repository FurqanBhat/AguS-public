import 'package:agus/model/courses_model.dart';
import 'package:agus/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/course_info_model.dart';
class CoursesWidget extends StatelessWidget {
  const CoursesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
    create: (context)=>CoursesInfoModel(),
      builder: (context, child) {
        return Container(
          child: ListView.builder(
            itemCount: CoursesModel.courses.length,
            itemBuilder: (context, index) {
              return ListTile(
                  iconColor: Colors.blueGrey[400],
                  leading: Icon(Icons.book),
                  title: Text(CoursesModel.courses[index]["name"]),
                  onTap: () {
                    CoursesInfoModel.courseCode=(CoursesModel.courses[index]["id"]);
                    Navigator.of(context).pushNamed(RouteManager.coursesInfo);
                  }
              );
            },

          ),
        );
      }
    );

  }
}
