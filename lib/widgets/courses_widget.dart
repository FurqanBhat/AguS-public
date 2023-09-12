import 'package:agus/model/courses_model.dart';
import 'package:agus/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/course_into_model.dart';
class CoursesWidget extends StatelessWidget {
  const CoursesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CoursesModel>().fetchCourses();
    return ChangeNotifierProvider(
    create: (context)=>CoursesInfoModel(),
      builder: (context, child) {
        return Consumer<CoursesModel>(
          builder: (context, courseModel, child) {
            return ListView.builder(
              itemCount: courseModel.courses.length,
              itemBuilder: (context, index) {
                return ListTile(
                    textColor: Colors.white,
                    iconColor: Colors.blue,
                    leading: Icon(Icons.book),
                    title: Text(courseModel.courses[index]["name"]),
                    onTap: () {
                      CoursesInfoModel.courseCode=(courseModel.courses[index]["id"]);
                      Navigator.of(context).pushNamed(RouteManager.coursesInfo);
                    }
                );
              },

            );
          },
        );
      }
    );

  }
}
