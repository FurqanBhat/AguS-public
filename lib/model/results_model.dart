import 'dart:convert';

import 'package:agus/model/course_info_model.dart';
import 'package:agus/model/login_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
class ResultsModel{
  static List<dynamic> results=[];
  static Future<void> getResults() async{
    final response=await get(Uri.parse('https://canvas.agu.edu.tr/api/v1/courses/${CoursesInfoModel.courseCode}/students/submissions?per_page=50&order=graded_at&order_direction=descending&include[]=assignment&include[]=total_scores&access_token=${LoginModel.token}'));
    if(response.statusCode==200){
      try{
        results=jsonDecode(response.body);
      }catch(e){
        print(e.toString());
      }
    }else{
      print("error in results_model, error code: ${response.statusCode}");
    }
}
}