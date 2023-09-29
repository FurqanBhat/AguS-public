import 'dart:convert';

import 'package:agus/model/course_info_model.dart';
import 'package:agus/model/courses_model.dart';
import 'package:agus/model/login_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
class LatestAssignmentsModel extends ChangeNotifier{
  List<dynamic> latestAssignments=[];
  bool finished=false;
  LatestAssignmentsModel(){
    fetchLatestAssignments();
    notifyListeners();
  }
  Future<void> fetchLatestAssignments() async{
    print("in latest assingments model");
    for(final course in CoursesModel.courses){
      final response=await get(Uri.parse('https://canvas.agu.edu.tr/api/v1/courses/${course['id']}/assignments?per_page=50&access_token=${LoginModel.token}'));
      if(response.statusCode==200){
        try {
          List<dynamic> list=jsonDecode(response.body);
          latestAssignments.addAll(list);
          finished=true;
          notifyListeners();
        }
        catch(e){
          print(e.toString());
        }
      }else{
        print("error in assignments_model, error code : ${response.statusCode}");
      }
    }
  }

}