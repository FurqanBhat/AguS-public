import 'dart:convert';

import 'package:agus/model/course_info_model.dart';
import 'package:agus/model/login_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
class AssignmentsModel{
  static List<dynamic> assignments=[];
  static Future<void> fetchAssignments() async{
    final response=await get(Uri.parse('https://canvas.agu.edu.tr/api/v1/courses/${CoursesInfoModel.courseCode}/assignments?per_page=50&access_token=${LoginModel.token}'));
    if(response.statusCode==200){
      try {
        assignments=jsonDecode(response.body);
      }
      catch(e){
        print(e.toString());
      }
    }else{
      print("error in assignments_model, error code : ${response.statusCode}");
    }
  }
}