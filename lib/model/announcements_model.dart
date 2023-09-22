import 'dart:convert';

import 'package:agus/model/course_info_model.dart';
import 'package:agus/model/courses_model.dart';
import 'package:agus/model/login_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
class AnnouncementsModel{
  static List<dynamic> announcements=[];
  static Future<void> fetchAnnouncements() async{
    final response=await get(Uri.parse('https://canvas.agu.edu.tr/api/v1/announcements?per_page=50&context_codes[]=course_${CoursesInfoModel.courseCode}&access_token=${LoginModel.token}'));
    if(response.statusCode==200){
      try{
        announcements=jsonDecode(response.body);
      }catch(e){
        print(e.toString());
      }
    }else{
      print("error in announcements_model, error code : ${response.statusCode}");
    }
  }
}