import 'dart:convert';

import 'package:agus/model/course_into_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'login_model.dart';
class FilesModel{

  static List<dynamic> files=[];
  static Future<void> fetchFiles() async{
  final response=await get(Uri.parse('https://canvas.agu.edu.tr/api/v1/courses/${CoursesInfoModel.courseCode}/files?per_page=50&sort=created_at&access_token=${LoginModel.token}'));
  if(response.statusCode==200){
    try{
      files=jsonDecode(response.body);
    }
    catch (e){
      print(e.toString());
    }
  }
  else{
    print("Errror in flies_model : ${response.statusCode}");
  }
  }

}